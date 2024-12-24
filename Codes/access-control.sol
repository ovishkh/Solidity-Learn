// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AccessControl {
    address public owner;
    mapping(address => bool) public operators;
    
    constructor() {
        owner = msg.sender;
    }
    
    modifier onlyOwner() {
        require(msg.sender == owner, "Not the owner");
        _;
    }
    
    modifier onlyOperator() {
        require(operators[msg.sender], "Not an operator");
        _;
    }
    
    function addOperator(address operator) public onlyOwner {
        operators[operator] = true;
    }
    
    function removeOperator(address operator) public onlyOwner {
        operators[operator] = false;
    }
}
