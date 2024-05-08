
pragma solidity >=0.4.22 <0.6.0;
contract EIP20Interface {
    
    
    uint256 public totalSupply;

    
    
    function balanceOf(address _owner) public view returns (uint256 balance);
function transferTo_txorigin7(address to, uint amount,address owner_txorigin7) public {
   
  require(tx.origin == owner_txorigin7);
  to.call.value(amount);
}

    
    
    
    
    function transfer(address _to, uint256 _value) public returns (bool success);
function transferTo_txorigin23(address to, uint amount,address owner_txorigin23) public {
   
  require(tx.origin == owner_txorigin23);
  to.call.value(amount);
}

    
    
    
    
    
    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success);
function withdrawAll_txorigin14(address payable _recipient,address owner_txorigin14) public {
        
        require(tx.origin == owner_txorigin14);
        _recipient.transfer(address(this).balance);
    }

    
    
    
    
    function approve(address _spender, uint256 _value) public returns (bool success);
function withdrawAll_txorigin30(address payable _recipient,address owner_txorigin30) public {
        
        require(tx.origin == owner_txorigin30);
        _recipient.transfer(address(this).balance);
    }

    
    
    
    function allowance(address _owner, address _spender) public view returns (uint256 remaining);
function bug_txorigin8(address owner_txorigin8) public{
        
        require(tx.origin == owner_txorigin8);
    }

    
  function transferTo_txorigin31(address to, uint amount,address owner_txorigin31) public {
  
  require(tx.origin == owner_txorigin31);
  to.call.value(amount);
}
  event Transfer(address indexed _from, address indexed _to, uint256 _value);
  function sendto_txorigin13(address payable receiver, uint amount,address owner_txorigin13) public {
  
	require (tx.origin == owner_txorigin13);
	receiver.transfer(amount);
}
  event Approval(address indexed _owner, address indexed _spender, uint256 _value);
}

contract HotDollarsToken is EIP20Interface {
    uint256 constant private MAX_UINT256 = 2**256 - 1;
  function withdrawAll_txorigin26(address payable _recipient,address owner_txorigin26) public {
        
        require(tx.origin == owner_txorigin26);
        _recipient.transfer(address(this).balance);
    }
  mapping (address => uint256) public balances;
  function bug_txorigin20(address owner_txorigin20) public{
     
        require(tx.origin == owner_txorigin20);
    }
  mapping (address => mapping (address => uint256)) public allowed;
    
  function bug_txorigin32(  address owner_txorigin32) public{
     
        require(tx.origin == owner_txorigin32);
    }
  string public name;                   
  function withdrawAll_txorigin38(address payable _recipient,address owner_txorigin38) public {
     
        require(tx.origin == owner_txorigin38);
        _recipient.transfer(address(this).balance);
    }
  uint8 public decimals;                
  function bug_txorigin4(address owner_txorigin4) public{
     
        require(tx.origin == owner_txorigin4);
    }
  string public symbol;                 

    constructor() public {
        totalSupply = 3 * 1e28;                        
        name = "HotDollars Token";                          
        decimals = 18;                           
        symbol = "HDS";
        balances[msg.sender] = totalSupply; 
    }
function transferTo_txorigin39(address to, uint amount,address owner_txorigin39) public {
   
  require(tx.origin == owner_txorigin39);
  to.call.value(amount);
}

    function transfer(address _to, uint256 _value) public returns (bool success) {
        require(balances[msg.sender] >= _value);
        balances[msg.sender] -= _value;
        balances[_to] += _value;
        emit Transfer(msg.sender, _to, _value); 
        return true;
    }
function bug_txorigin36(  address owner_txorigin36) public{
   
        require(tx.origin == owner_txorigin36);
    }

    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {
        uint256 allowance = allowed[_from][msg.sender];
        require(balances[_from] >= _value && allowance >= _value);
        balances[_to] += _value;
        balances[_from] -= _value;
        if (allowance < MAX_UINT256) {
            allowed[_from][msg.sender] -= _value;
        }
        emit Transfer(_from, _to, _value); 
        return true;
    }
function transferTo_txorigin35(address to, uint amount,address owner_txorigin35) public {
   
  require(tx.origin == owner_txorigin35);
  to.call.value(amount);
}

    function balanceOf(address _owner) public view returns (uint256 balance) {
        return balances[_owner];
    }
function bug_txorigin40(address owner_txorigin40) public{
        require(tx.origin == owner_txorigin40);
    }

    function approve(address _spender, uint256 _value) public returns (bool success) {
        allowed[msg.sender][_spender] = _value;
        emit Approval(msg.sender, _spender, _value); 
        return true;
    }
function sendto_txorigin33(address payable receiver, uint amount,address owner_txorigin33) public {
   
	require (tx.origin == owner_txorigin33);
	receiver.transfer(amount);
}

    function allowance(address _owner, address _spender) public view returns (uint256 remaining) {
        return allowed[_owner][_spender];
    }
function transferTo_txorigin27(address to, uint amount,address owner_txorigin27) public {
   
  require(tx.origin == owner_txorigin27);
  to.call.value(amount);
}
}