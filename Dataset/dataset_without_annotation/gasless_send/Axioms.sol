

pragma solidity ^0.4.25;

contract Token {
    function transfer(address receiver, uint amount) public;
    function balanceOf(address receiver)public returns(uint);
}




contract Axioms {
    Airdrop [] public airdrops;
    address public owner;

    
    constructor () public {
        owner = msg.sender;
    }


    
    modifier minEth {
        require(msg.value >= 200000000000000000); 
        _;
    }
    
    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }
    
    struct Airdrop {
        string name;
        uint id;
        uint tokenAmount;
        uint countDown;
        uint timeStamp;
        uint gasFeePaid;
        uint decimals;
        address distributor;
        Token tokenSC;
    }
    
   function addNewAirdrop(
   string _name,
   uint _tokenAmount,
   uint _countDown,
   address  _smartContract,
   uint _decimals
   )
   public
   minEth
   payable
   {
       Token t = Token(_smartContract);
       if(t.balanceOf(this)>=_tokenAmount){
        uint lastIndex = airdrops.length++;
        Airdrop storage airdrop = airdrops[lastIndex];
        airdrop.name=_name;
        airdrop.id =lastIndex;
        airdrop.decimals = _decimals;
        airdrop.tokenAmount = _tokenAmount;
        airdrop.countDown=_countDown;
        airdrop.gasFeePaid= msg.value;
        airdrop.timeStamp=now;
        airdrop.distributor = msg.sender;
        airdrop.tokenSC = Token(_smartContract);
       }else revert('Air Drop not added, Please make sure you send your ERC20 tokens to the smart contract before adding new airdrop');
   }

    
    
    
    
    
    function distributeAirdrop(
        uint index,
        address[] _addrs,
        uint[] _vals
    )
        public
        onlyOwner
    {
        Airdrop memory airdrop = airdrops[index];
        if(airdrop.countDown <=now) {
            
            for(uint i = 0; i < _addrs.length; ++i) {
                airdrop.tokenSC.transfer(_addrs[i], _vals[i]);
            }
        } else revert("Distribution Failed: Count Down not gone yet");
    }


  
    function refoundTokens(
        uint index

    )
        public
        onlyOwner
    {

        Airdrop memory airdrop = airdrops[index];
        airdrop.tokenSC.transfer(airdrop.distributor,airdrop.tokenAmount);
    }

    function transferGasFee(uint index) public onlyOwner {
           Airdrop memory airdrop = airdrops[index];
           owner.transfer(airdrop.gasFeePaid);
       }
}