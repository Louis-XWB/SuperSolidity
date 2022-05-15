// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract ValueTypes{
    //布尔类型
    bool public _bool = true;

    //整型
    //有符号
    int public _int = -24;
    //无符号
    uint public _uint = 34;

    //幂运算
    uint public _uint2 = 10*(2**21);

    //地址类型
    address public _address = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;
    //地址类型，拥有balance和tranfer()
    address payable public _addressP = payable(_address);

    uint public _balance = _addressP.balance;

    // 固定长度的字节数组
    bytes32 public _byte32 = "MiniSolidity"; 
    bytes1 public _byte = _byte32[0]; 
    uint public _byte32_length = _byte32.length;

    //枚举 uint8
    enum ActionChoices { GoLeft, GoRight, GoStraight, SitStill }
    ActionChoices public _enum = ActionChoices.GoRight;
}