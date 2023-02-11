// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.10;

interface IERC20 {
    function totalSupply() external view returns (uint256);
    function balanceOf(address account) external view returns (uint256);
    function allowance(address owner, address spender) external view returns (uint256);

    function transfer(address recipient, uint256 amount) external returns (bool);
    function approve(address spender, uint256 amount) external returns (bool);
    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);

    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);
}


contract Token is IERC20 {
    mapping(address => uint256) balances;

    mapping(address => mapping (address => uint256)) allowed;

    uint256 totalSupply_ = 10 ether;

    constructor() {
        balances[msg.sender] = totalSupply_;
    }

    function totalSupply() public override view returns (uint256) {
        return totalSupply_;
    }

    function balanceOf(address account) public override view returns (uint256) {
        return balances[account];
    }

    function transfer(address to, uint256 count) public override returns (bool) {
        require(count <= balances[msg.sender]);

        balances[msg.sender] = balances[msg.sender] - count;
        balances[to] = balances[to] + count;

        emit Transfer(msg.sender, to, count);
        return true;
    }

    function approve(address account, uint256 count) public override returns (bool) {
        allowed[msg.sender][account] = count;

        emit Approval(msg.sender, account, count);
        return true;
    }

    function allowance(address account, address from) public override view returns (uint) {
        return allowed[account][from];
    }

    function transferFrom(address account, address buyer, uint256 count) public override returns (bool) {
        require(count <= balances[account]);
        require(count <= allowed[account][msg.sender]);

        balances[account] = balances[account] - count;
        allowed[account][msg.sender] = allowed[account][msg.sender] - count;
        balances[buyer] = balances[buyer] + count;

        emit Transfer(account, buyer, count);
        return true;
    }
}
