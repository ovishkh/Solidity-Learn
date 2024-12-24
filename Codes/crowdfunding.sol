// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Crowdfunding {
    address public owner;
    uint public goal;
    uint public deadline;
    mapping(address => uint) public contributions;

    constructor(uint _goal, uint _duration) {
        owner = msg.sender;
        goal = _goal;
        deadline = block.timestamp + _duration;
    }

    function contribute() public payable {
        require(block.timestamp < deadline, "Campaign ended");
        contributions[msg.sender] += msg.value;
    }

    function withdraw() public {
        require(msg.sender == owner, "Not the owner");
        require(address(this).balance >= goal, "Goal not reached");
        payable(owner).transfer(address(this).balance);
    }
}
