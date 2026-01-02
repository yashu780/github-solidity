// SPDX-License-Identifier:MIT
//only owner change new owner,2 function 1 called by owner 1 called by anyone, 1 modifier,1 constructor
pragma solidity ^0.8.8;
contract ownable{
 address public owner;
 constructor() {
    owner=msg.sender;
 }
 modifier onlyOwner(){
    require(msg.sender==owner,"not owner");
    _;
 }
 function setowner(address _newowner)external onlyOwner{
    require(_newowner !=address(0),"invalid address");
    owner=_newowner;
 }
 function onlyOwnerCanCall() external onlyOwner{

 }
 function anyoneCanCall() external{
    
 }
}
