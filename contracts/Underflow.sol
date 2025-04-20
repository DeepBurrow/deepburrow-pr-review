// SPDX-License-Identifier: MIT

pragma solidity ^0.7;

contract UnderflowContract {
 
    uint8 initialSupply = 50;
    mapping(address => uint8) public tokenBalances;

    constructor() {
        tokenBalances[msg.sender] = initialSupply;
    }

    function transferBalance(address to, uint8 amount) public payable {  
        require(tokenBalances[msg.sender] - amount >= 0);
        tokenBalances[msg.sender] -= amount;
        tokenBalances[to] += amount;
    }
}