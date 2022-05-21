// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract TestModifier{

    address owner;

    bool public locked = true;

    // 定义modifier
   modifier onlyOwner {
      require(msg.sender == owner); // 检查调用者是否为owner地址
    //   require(msg.sender == owner, "Not owner"); // 定义报错内容
      _; // 如果是的话，继续运行函数主体；否则报错并revert交易
   }

   modifier validAddress(address _addr) {//可传参数
        require(_addr != address(0), "Not valid address");
        _;
    }

   function changeOwner(address _newOwner) external onlyOwner validAddress(_newOwner){
      owner = _newOwner; // 只有owner地址运行这个函数，并改变owner
   }

    modifier noReentrancy() {
        require(!locked, "No reentrancy");

        locked = true;
        _;
        locked = false;
    }

    function testLocked() public noReentrancy{

    }
}