// SPDX-License-Identifier:MIT
pragma solidity ^0.8.10;
 
 contract calculator {

  mapping(address => uint256) public results;
 function add(uint256 num) public {
results[msg.sender] += num;
}
function substract(uint256 num) public
{
    results[msg.sender] -= num;
}
function multiply(uint256 num) public{
    results[msg.sender] *=num;
}
function get() public view returns(uint256){
    return results[msg.sender];
}

}
