// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Function{

    int number = 5;

    // private: 内部
    function privateCall() private {
        number = number - 1;
    }

    // internal: 内部
    function internalCall() internal {
        number = number - 1;
    }

    // 合约内的函数可以调用内部函数
    function externalCall() external {
        internalCall();
    }

    // 合约内的函数可以调用内部函数
    function publicCall() public {
        internalCall();
    }

    function testCall() public{
        privateCall();
        internalCall();
        this.externalCall();
    }


    //pure view payable
    // 默认
    function add() external{
        number = number + 1;
    }

    // pure
    function pureAdd(int paraNumber) external pure returns(int newNumber){
        // number = number + 1;//报错，无法访问number
        newNumber = paraNumber + 1;//报错，无法访问number
    }

    // view
    function viewAdd(int paraNumber) external view returns(int newNumber){
        // number = number + 1;//报错，无法改写number
        newNumber = number + paraNumber + 1;//报错，无法访问number
    }

    // payable: 递钱，能给合约支付eth的函数
    function minusPayable() external payable returns(uint256 balance) {
        internalCall();    
        balance = address(this).balance;
    }


    //return
    function returnFunc() external view returns(int returnNum){
        int testNum = this.pureAdd(3) + 1;
        returnNum += testNum;
    }

}

