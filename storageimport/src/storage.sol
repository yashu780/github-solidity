// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;
import {SimpleStorage, SimpleStorage3} from "./SimpleStorage.sol";
contract storageEg{
    SimpleStorage[] public listOfsimplestorage;
   function createStorageContract() public{
 SimpleStorage newSimplestorageContract = new SimpleStorage();
   listOfsimplestorage.push(newSimplestorageContract);
   
   }
}

