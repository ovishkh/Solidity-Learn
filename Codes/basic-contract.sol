// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MyContract {
    uint public myNumber = 10;
    string public myString = "Hello, Solidity!";

    constructor() {
    }

    function setNumber(uint _number) public {
        myNumber = _number;
    }

    function getNumber() public view returns (uint) {
        return myNumber;
    }
}
