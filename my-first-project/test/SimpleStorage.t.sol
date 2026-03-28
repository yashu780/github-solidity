// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

import "forge-std/Test.sol";
import "../src/SimpleStorage.sol";

contract SimpleStorageTest is Test {
    SimpleStorage public store;

    function setUp() public {
        store = new SimpleStorage();
    }

    function test_SetValue() public {
        store.setValue(42);
        assertEq(store.getValue(), 42);
    }

    function test_OnlyOwnerCanSet() public {
        vm.prank(address(0x123));
        vm.expectRevert("Not owner");
        store.setValue(42);
    }
}