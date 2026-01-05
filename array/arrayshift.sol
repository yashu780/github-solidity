// SPDX-License-Identifier:MIT
pragma solidity ^0.8.10;
contract arrayshift{
    uint[] public arr;
     function example() public{
        arr=[1,2,3];
        delete arr[1];
     }
     // [1,2,3,4]--> remove[1]-->[1,3,4,4]-->pop[1,3,4]
     function remove(uint _index)public{
        require(_index <arr.length,"index out of the bound");
        for(uint i=_index;i<arr.length-1;i++){
            arr[i]=arr[i+1];
        }
        arr.pop();
     }
     function test() external view{
        assert(arr[0]==1);
        assert(arr[1]==2);


     }
}