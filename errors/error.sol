// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

contract SimpleErrors {

    address public owner;
    uint public balance;

    constructor() {
        owner = msg.sender;
        balance = 10;
    }

    function withdraw(uint amount) public {

        // 1️⃣ require → check user input
        require(amount > 0, "Amount must be greater than zero");

        // 2️⃣ revert → manual stop based on logic
        if (amount > balance) {
            revert("Not enough balance");
        }

        // update state
        balance -= amount;

        // 3️⃣ assert → internal check (should never fail)
        assert(balance >= 0);
    }
}

