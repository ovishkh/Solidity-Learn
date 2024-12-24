// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Voting {
    mapping(address => bool) public voters;
    mapping(string => uint) public votes;
    string[] public candidates;
    
    function addCandidate(string memory name) public {
        candidates.push(name);
    }
    
    function vote(string memory name) public {
        require(!voters[msg.sender], "Already voted");
        votes[name]++;
        voters[msg.sender] = true;
    }
}
