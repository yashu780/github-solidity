// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

import {Test} from "forge-std/Test.sol";
import {calculator} from "../src/calculator.sol";

contract testCalculator is Test {
    calculator public calc;
    
    // fake users
    address user1 = address(0x1);
    address user2 = address(0x2);

    function setUp() public {
        calc = new calculator();
    }

    // user1 adds 5 → their result should be 5
    function test_AddIncreasesResult() public {
        vm.prank(user1);
        calc.add(5);
        
        vm.prank(user1);
        assertEq(calc.get(), 5);
    }

    // user1 adds 10 then subtracts 3 → should be 7
    function test_AddThenSubtract() public {
        vm.prank(user1);
        calc.add(10);
        
        vm.prank(user1);
        calc.substract(3);
        
        vm.prank(user1);
        assertEq(calc.get(), 7);
    }

    // user1 adds 5 then multiplies by 2 → should be 10
    function test_AddThenMultiply() public {
        vm.prank(user1);
        calc.add(5);
        
        vm.prank(user1);
        calc.multiply(2);
        
        vm.prank(user1);
        assertEq(calc.get(), 10);
    }

    // multiply by zero → should be 0
    function test_MultiplyByZero() public {
        vm.prank(user1);
        calc.add(10);
        
        vm.prank(user1);
        calc.multiply(0);
        
        vm.prank(user1);
        assertEq(calc.get(), 0);
    }

    // subtract more than result → should revert
    function test_SubtractMoreThanResult() public {
        vm.prank(user1);
        vm.expectRevert();
        calc.substract(5);
    }

    // most important test — user1 and user2 results are separate
    function test_UsersAreIsolated() public {
        vm.prank(user1);
        calc.add(100);

        vm.prank(user2);
        calc.add(50);

        vm.prank(user1);
        assertEq(calc.get(), 100); // user1 unaffected by user2

        vm.prank(user2);
        assertEq(calc.get(), 50); // user2 unaffected by user1
    }
}