// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Constants{

    //1、constant只支持值类型和字符串，immutable可以；
    address public constant MY_ADDRESS = 0x777788889999AaAAbBbbCcccddDdeeeEfFFfCcCc;
    uint public constant MY_UINT = 123;
    string public constant MY_STRING = "123";
    bytes public constant MY_BYTES = "123";

    address public immutable MY_ADDRESS_IM = 0x777788889999AaAAbBbbCcccddDdeeeEfFFfCcCc;
    uint public immutable MY_UINT_IM = 123;
    // string public immutable MY_STRING_IM = 123;
    //bytes public immutable MY_BYTES = "123";

    //2、constant必须声明时就赋值，immutable可以推迟到构造函数里赋值
    uint public immutable MY_UINT_CONSTRUCTOR;
    uint256 public immutable IMMUTABLE_TEST;

    constructor(){
        MY_UINT_CONSTRUCTOR = 123;
        IMMUTABLE_TEST = test();
    }

    function test() public pure returns(uint256){
        uint256 what = 9;
        return(what);
    }
}