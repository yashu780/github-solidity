// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract Loop {
    uint[] public forloopresult;
    uint public whileloopcounter;

    function loop() public  {
        delete forloopresult;//reset the array before execution
        // for loop
        for (uint256 i = 0; i < 10; i++) {
            if (i == 3) {
                // Skip to next iteration with continue
                continue;
            }
            if (i == 5) {
                // Exit loop with break
                break;
            }
            forloopresult.push(i);
        }
    }
        // while loop
        function executewhileloop() public{
            whileloopcounter=0;
        uint256 j;
        while (j < 10) {
            j++;
        }}
        function getforloopresult() public view returns ( uint256[] memory ) {
            return forloopresult;
        }        
}

