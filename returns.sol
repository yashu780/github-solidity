// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;
contract returnsType{
function returnMany() public pure returns(uint i,bool b){
   return (1, true);
    
}
function destructiveAssignment() public pure {
    ( ,bool _b ) = returnMany();
    _b=false;
}
}
