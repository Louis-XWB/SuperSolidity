// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract ReferenceType{
    uint[] public arr;
    uint[] public arr2 = [1, 2, 3];
    // Fixed sized array, all elements initialize to 0
    uint[10] public myFixedSizeArr;

    uint public x;

    // 结构体
    struct Student{
        uint256 id;
        uint256 score; 
    }

    Student student; // 初始一个student结构体

    function testArr() public{
        // 固定长度 Array
        uint[8] memory array1;
        address[100]  memory array3;

        // 可变长度 Array
        uint[] memory array4;
        address[] memory array6;
        bytes memory array7;//bytes比较特殊，只有可变数组，不用加[]

        // memory可变长度 Array
        uint[] memory array8 = new uint[](2);
        bytes memory array9 = new bytes(9);

        array8[0] = 1;
        array8[1] = 1;


        uint[2] memory array10 = [uint(1),2];

        
        uint[] memory x = new uint[](3);
        x[0] = 1;
        x[1] = 3;
        x[2] = 4;

        arr2.push();

        Student storage _student = student;
        _student.id = 1;
        _student.score = 99;
    }

    function x0()public{
        x = arr2[0];
    }

    function x1()public{
        x = arr2[1];
    }

    function x2()public{
        x = arr2[2];
    }

    function x3()public{
        x = arr2[3];
    }

    function length()public{
        x = arr2.length;
    }


    function testStudent() public{
        student.id = 5;
        student.score = 100;
    }
    

}