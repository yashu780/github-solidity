// SPDX-License-Identifier:MIT
pragma solidity ^0.8.12;
contract array{
    uint [] public arr=[1,2,3,4];
    // pop push delete update length get
    uint [] public nums;
    function arrayuse() public  {
    nums = [1,2,3];
    nums.push(10);
    nums.length;
    delete nums[1];
    nums[2]=5;
    nums.pop();
    // creating array in memory
    uint[] memory a = new uint[](5);
    a[1]=123;
}
function returnArray() external view returns(uint[] memory) {
return nums;
}

}