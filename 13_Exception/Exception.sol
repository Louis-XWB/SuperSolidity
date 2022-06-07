// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Exception{

    // 一组映射，记录每个TokenId的Owner
    mapping(uint256 => address) private _owners;

    error TransferNotOwner();

    function transferOwner1(uint256 tokenId,address newOwner) public{
        if(_owners[tokenId] != msg.sender){
            revert TransferNotOwner();
        }

        _owners[tokenId] = newOwner;
    }

    function transferOwner2(uint256 tokenId,address newOwner) public{
        require(_owners[tokenId] == msg.sender,"Transfer Not Owner");
         _owners[tokenId] = newOwner;
    }

    function testRevert(uint _i) public pure {
        // Revert is useful when the condition to check is complex.
        // This code does the exact same thing as the example above
        if (_i <= 10) {
            revert("Input must be greater than 10");
        }
    }

    function testRequire(uint _i) public pure {
        // Require should be used to validate conditions such as:
        // - inputs
        // - conditions before execution
        // - return values from calls to other functions
        require(_i > 10, "Input must be greater than 10");
    }

    function transferOwner3(uint256 tokenId, address newOwner) public {
        assert(_owners[tokenId] == msg.sender);
        _owners[tokenId] = newOwner;
    }

}