// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IERC20 {
    function transferFrom(address sender, address recipient, uint amount) external returns (bool);
    function transfer(address recipient, uint amount) external returns (bool);
}

contract SimpleDEX {
    mapping(address => mapping(address => uint)) public liquidity;
    
    function addLiquidity(address token, uint amount) public {
        require(IERC20(token).transferFrom(msg.sender, address(this), amount), "Transfer failed");
        liquidity[msg.sender][token] += amount;
    }
    
    function removeLiquidity(address token, uint amount) public {
        require(liquidity[msg.sender][token] >= amount, "Insufficient liquidity");
        require(IERC20(token).transfer(msg.sender, amount), "Transfer failed");
        liquidity[msg.sender][token] -= amount;
    }
}
