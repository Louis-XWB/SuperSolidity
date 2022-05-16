// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract DataStorage{

    uint[] x;// x 的数据存储位置是 storage

    function f(uint[] memory memoryArray) public{//函数参数的存储位置必须声明，否则报错

        //合约storage变量 赋值给其他变量
        uint[] storage _storage = x;// 将合约变量storage数组拷贝到storage中
        uint[] memory _memory = x;// 将合约变量storage数组拷贝到memory中
        
        // 参数变量赋值给合约storage变量
        x = memoryArray; // 将整个数组拷贝到 storage 中，可行
        uint[] storage y = x;  // 分配一个指针（其中 y 的数据存储位置是 storage），可行
        y[7]; // 返回第 8 个元素，可行
        y.pop(); // 通过 y 修改 x，可行
        delete x; // 清除数组，同时修改 y，可行
        

        uint[] memory _memory2 = memoryArray;//将参数 memory 数组拷贝到新的 memory 变量数组中，可行
        //uint[] storage _storage2 = memoryArray;(不可行)
        //将参数 memory 数组拷贝到新的 storage 变量数组中,(不可行)，
        //因为storage需要静态分配，无法动态分配，因此把 memory 传给还未分配的storage地址，编译就会报错
        
        

        g(x); // calls g, handing over a reference to x
        h(x); // calls h and creates an independent, temporary copy in memory
    }

    function g(uint[] storage) internal pure {}
    function h(uint[] memory) public pure {}

    function fCalldata(uint[] calldata _x) public pure returns(uint[] calldata){
        //参数为calldata数组，不能被修改
        // _x[0] = 0; //这样修改会报错
        return(_x);
    }

}