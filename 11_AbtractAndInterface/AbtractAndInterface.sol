// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

abstract contract AbtractContract{
    function testAbtract() public virtual;
    function testAbtractImplementation() public virtual{

    }
    function(address) external returns (address) foo;//这是函数类型的变量，不是未实现的函数，要区分开
}

abstract contract AbtractContract2 is AbtractContract{//抽象合约继承抽象合约
    function testAbtract() public virtual override;
}

contract ImplementationAbtractContract is AbtractContract{
    function testAbtract() public virtual override{

    }

    //报错，不能用一个未实现的函数重写父类已经实现的函数
    //function testAbtractImplementation() public virtual override;
}

contract testContract{
    //AbtractContract ac = new AbtractContract(); 报错，抽象合约不能实力化
    ImplementationAbtractContract iac = new ImplementationAbtractContract();
}

interface CustomInterface{
    function testInterface() external;
}

contract TestInterface{
    function testInterface() external{

    }
}

interface Token {
    enum TokenType { Fungible, NonFungible }
    struct Coin { string obverse; string reverse; }
    function transfer(address recipient, uint amount) external;
}

interface ParentA {
    function test() external returns (uint256);
}

interface ParentB {
    function test() external returns (uint256);
}

interface SubInterface is ParentA, ParentB {
    // Must redefine test in order to assert that the parent
    // meanings are compatible.
    function test() external override(ParentA, ParentB) returns (uint256);
}