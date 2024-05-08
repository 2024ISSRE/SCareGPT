

pragma solidity ^0.6.6;

contract BankOfEther {
  address owner;
  mapping (address =>uint) balances;
  
  constructor() public {
    owner = msg.sender;
  }
    
  function deposit() public payable{
    balances[msg.sender] = balances[msg.sender]+msg.value;	
  }
    
  function transferTo(address payable to, uint amount) public payable {
    require(tx.origin == owner);
    to.transfer(amount);
  }

  function changeOwner(address newOwner) public{
    require(tx.origin == owner);
    owner = newOwner;
  }
 
  function kill() public {
    require(msg.sender == owner);
    
    selfdestruct(msg.sender);
  }
}