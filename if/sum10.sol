//SPDX-License-Identifier:MIT
pragma solidity ^0.8.17;
contract sum10{
    
    function sum(uint64 x) external pure returns(uint64 total){
        for(uint64 i=0;i<10;i++){
             total += x + i;
        }
    }
}