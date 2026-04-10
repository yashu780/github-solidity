// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract SimpleStorage {
    uint256 private value;
    address public owner;
    uint256 private myFavoriteNumber;
    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Not owner");
        _;
    }

    function setValue(uint256 _value) public onlyOwner {
        value = _value;
    }

    function getValue() public view returns (uint256) {
        return value;
    }
    function store(uint256 _number) public {  // must be public
        myFavoriteNumber = _number;
    }

    function retrieve() public view returns (uint256) {  // must be public
        return myFavoriteNumber;
    }
}
contract SimpleStorage2{}
contract SimpleStorage3{}
contract SimpleStorage4{}