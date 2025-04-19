// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract VulnerableContract {

    mapping(address => uint ) public balances;

    function depositFunds() public payable {
        balances[msg.sender] += msg.value;
    }

    function withdrawMyBalance() public payable {  

        // Gets the address that is withdrawing money and the balance for that account
        address to = msg.sender;
        uint myBalance = balances[msg.sender];
        
        // Validates the balance, sends the money to the account, and resets the balance for that account
        if (myBalance > 0) {
                (bool success, ) = to.call{value:myBalance}("");
                require(success, "Transfer failed.");
                balances[msg.sender] = 0;
        }    
    }
}