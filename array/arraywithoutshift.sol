// SPDX-License-Identifier:MIT
pragma solidity ^0.8.10;
contract shiftArrayEfficiently{
    uint[]public num;
    function remove (uint _index) public {
        num[_index]=num[num.length-1];
        num.pop();
    }
    function test() external{
        num =[1,2,3,4];
        remove(2);
        assert(num.length==3);
        assert(num[0]==1);
        assert(num[1]==2);
        assert(num[2]==4);
         remove(2);
assert(num.length==2);
assert(num[0]==1);
assert(num[1]==2);

    }
}