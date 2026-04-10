// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;
import {SimpleStorage} from "./SimpleStorage.sol";
contract storageEg{
    SimpleStorage[] public listOfsimplestorage;
   //address [] public listOfsimplestorage;
   function createStorageContract() public{
 SimpleStorage newSimplestorageContract = new SimpleStorage();
   listOfsimplestorage.push(newSimplestorageContract);
   
   }
   function sfstore(uint256 _simplestorageindex, uint256 _newsimplestoragenumber )public {
    //address
    //ABI: APPLICATION BINARY INTERFACE
    SimpleStorage mysimplestorage = listOfsimplestorage[_simplestorageindex];
    mysimplestorage.store(_newsimplestoragenumber);

   }
   function sfget(uint256 _simplestorageindex) public view returns(uint256){
    SimpleStorage mysimplestorage = listOfsimplestorage[_simplestorageindex];
    return mysimplestorage.retrieve();
   }
}

