// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Mapping{
    mapping(uint => address) users;
    mapping(address => uint) myMap;
    mapping(uint => bool) uintMap;
    mapping(uint => uint[]) myArrayMap;
    mapping(uint => uint[]) public myPublicArrayMap;

    address public myAddress;
    address public myNum;

        // 我们定义一个结构体 Struct
    struct Student{
        uint256 id;
        uint256 score; 
    }
    mapping(uint => Student) public testVar;
    // mapping(Student => uint) public testVar2;//报错 key不能使用struct类型


    function testMapping() public payable{
        users[123] = address(0x5B38Da6a701c568545dCfcB03FcB875f56beddC4);

        myAddress = users[123];

        uintMap[100] = true;

        bool _bool = uintMap[100];

        // myPublicArrayMap.get(100);

    }

    // function testMappingStorage(mapping(uint => uint) memory myMapping) public{
    //     //mappings can only be parameters or return variables of internal or library functions.
    // }

    // function testMappingStorage() internal returns(mapping(uint => uint) storage x){
    //     return x;
    // }
}