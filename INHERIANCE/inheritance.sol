//INHERITENCE IS USING FUNCTIONS OF PARENT CLASS
//IS KEYWORD IS USED, VIRTUAL IS USED WHEN YOU HAVE TO USE THAT FUNCTION IN CHILD CLASS
//OVERRIDE IS USED WHEN YOU HAVE TO AMMEND SOMETHING IN THAT FUNCTION WHICH IS IMPORTED FROM PARENT 


// SPDX-License-Identifier:MIT
pragma solidity ^0.8.10;
contract grandParent{
    function bike() virtual pure public returns(string memory){
        return "bike in will";
    }
}
contract parent is grandParent{
    function car() virtual pure public returns(string memory){
        return "car in will";
    }
     function bike() virtual override pure public returns(string memory){
        return "bike in will is old";
}}
contract child is parent{
    function s1000rrSb() virtual pure public returns(string memory){
        return "yeh h asli bike";

    }
         function bike() override pure public returns(string memory){
        return "bike in will is old not good for children";
}
}