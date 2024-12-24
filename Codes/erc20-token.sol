// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IERC20 {
    function totalSupply() external view returns (uint);
    function balanceOf(address account) external view returns (uint);
    function transfer(address recipient, uint amount) external returns (bool);
    function allowance(address owner, address spender) external view returns (uint);
    function approve(address spender, uint amount) external returns (bool);
    function transferFrom(address sender, address recipient, uint amount) external returns (bool);
}

contract MyToken is IERC20 {
    string public name = "MyToken";
    string public symbol = "MTK";
    uint8 public decimals = 18;
    uint public override totalSupply;

    mapping(address => uint) balances;
    mapping(address => mapping(address => uint)) allowances;

    constructor(uint _initialSupply) {
        totalSupply = _initialSupply * 10 ** uint(decimals);
        balances[msg.sender] = totalSupply;
    }

    function balanceOf(address account) public view override returns (uint) {
        return balances[account];
    }

    function transfer(address recipient, uint amount) public override returns (bool) {
        require(balances[msg.sender] >= amount, "Insufficient balance");
        balances[msg.sender] -= amount;
        balances[recipient] += amount;
        return true;
    }

    function allowance(address owner, address spender) public view override returns (uint) {
        return allowances[owner][spender];
    }

    function approve(address spender, uint amount) public override returns (bool) {
        allowances[msg.sender][spender] = amount;
        return true;
    }

    function transferFrom(address sender, address recipient, uint amount) public override returns (bool) {
        require(balances[sender] >= amount, "Insufficient balance");
        require(allowances[sender][msg.sender] >= amount, "Insufficient allowance");
        
        balances[sender] -= amount;
        balances[recipient] += amount;
        allowances[sender][msg.sender] -= amount;
        
        return true;
    }
}
