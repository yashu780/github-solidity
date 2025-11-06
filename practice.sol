// SPDX-License-Identifier: MIT
//primitive datatypes
pragma solidity ^0.8.30;
contract greet{
    string public greetings="happy birthday";
    uint public date=15;
    int public year=-2004;
    bool public isyear=false;
    address public birthdayboy=0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;
    //uint=no negative integet
    //uint=unsigned integer;
    // bool=boolean;
    //variables
    string public num="two";//static variable

    function localvariable()public pure returns(uint) {
    uint i=25;
       uint j=25;
       uint k=i+j;
       return(k);
    }
    //function to change the value of variable
    function changevalue()public{
        greetings="happy birthday to you";
    }   

}
 
