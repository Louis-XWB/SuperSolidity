// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Inheritance{
    string public output;
    function testParent() public{
        A a = new A();
        output = a.foo();
    }

    function testInheritance() public{
        AA b = new AA();
        output = b.foo();
    }
    
}

contract A {
    function foo() public pure virtual returns (string memory) {
        return "A";
    }
}

// Contracts inherit other contracts by using the keyword 'is'.
contract AA is A {
    // Override A.foo()
    function foo() public pure virtual override returns (string memory) {
        return "AA";
    }

    modifier validAddress(address _addr) virtual {
        require(_addr != address(0), "Not valid address");
        _;
    }
}

contract AAA is A , AA{

    function foo() public pure virtual override(A,AA) returns (string memory) {
        return "AAA";
    }

    modifier validAddress(address _addr) virtual override{
        require(_addr != address(0), "Not valid address");
        _;
    }

    function callParent() public pure{
        A.foo();
    }

    function callParentSuper() public pure{
        super.foo();
    }
}



