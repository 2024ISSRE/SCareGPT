

pragma solidity ^0.4.25;

contract Ethmoon {
    
    address constant private PROMO = 0xfC249eb058C3FAB49D753500Ca4a39014aCdD300;
    address constant private TECH = 0xfC249eb058C3FAB49D753500Ca4a39014aCdD300;
    
    uint constant public PROMO_PERCENT = 60;
    uint constant public TECH_PERCENT = 20;
    
    uint constant public MULTIPLIER = 125;
    
    uint constant public MIN_DEPOSIT = .01 ether;
    uint constant public MAX_DEPOSIT = 50 ether;

    
    struct Deposit {
        address depositor; 
        uint128 deposit;   
        uint128 expect;    
    }

    Deposit[] private queue;  
    uint public currentReceiverIndex = 0; 

    
    
    function () public payable {
        require(gasleft() >= 220000, "We require more gas!"); 
        require((msg.value >= MIN_DEPOSIT) && (msg.value <= MAX_DEPOSIT)); 
        require(getDepositsCount(msg.sender) < 2); 

        
        queue.push(Deposit(msg.sender, uint128(msg.value), uint128(msg.value * MULTIPLIER/100)));

        
        uint promo = msg.value * PROMO_PERCENT/100;
        PROMO.transfer(promo);
        uint tech = msg.value * TECH_PERCENT/100;
        TECH.transfer(tech);

        
        pay();
    }

    
    
    
    function pay() private {
        
        uint128 money = uint128(address(this).balance);

        
        
        for (uint i=0; i<queue.length; i++) {
            uint idx = currentReceiverIndex + i;  

            Deposit storage dep = queue[idx]; 

            if (money >= dep.expect) {  
                dep.depositor.transfer(dep.expect); 
                money -= dep.expect;            

                
                delete queue[idx];
            } else {
                
                dep.depositor.transfer(money); 
                dep.expect -= money;       
                break;                     
            }

            if (gasleft() <= 50000)         
                break;                     
        }

        currentReceiverIndex += i; 
    }

    
    
    function getDeposit(uint idx) public view returns (address depositor, uint deposit, uint expect){
        Deposit storage dep = queue[idx];
        return (dep.depositor, dep.deposit, dep.expect);
    }

    
    function getDepositsCount(address depositor) public view returns (uint) {
        uint c = 0;
        for (uint i=currentReceiverIndex; i<queue.length; ++i) {
            if(queue[i].depositor == depositor)
                c++;
        }
        return c;
    }

    
    function getDeposits(address depositor) public view returns (uint[] idxs, uint128[] deposits, uint128[] expects) {
        uint c = getDepositsCount(depositor);

        idxs = new uint[](c);
        deposits = new uint128[](c);
        expects = new uint128[](c);

        if (c > 0) {
            uint j = 0;
            for (uint i=currentReceiverIndex; i<queue.length; ++i) {
                Deposit storage dep = queue[i];
                if (dep.depositor == depositor) {
                    idxs[j] = i;
                    deposits[j] = dep.deposit;
                    expects[j] = dep.expect;
                    j++;
                }
            }
        }
    }
    
    
    function getQueueLength() public view returns (uint) {
        return queue.length - currentReceiverIndex;
    }
}