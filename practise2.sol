 //SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract favoriteNumber{
    mapping (address=>uint) public FavouriteNumber;

 function setfavoritenumber(uint _number)public {
    FavouriteNumber[msg.sender]=_number;

 }
 function getfavouriteNumber(address _user) public view returns (uint){
    return FavouriteNumber[_user];

 }
}