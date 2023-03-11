// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

// Uncomment this line to use console.log
// import "hardhat/console.sol";

contract Bank {
    
    uint256 public balance = 0; 

    function  withdraw(uint256 _amount) external payable{
        require(balance >= _amount, "INSUFFICIENT BALANCE.");
        balance -= _amount;
    }

    function deposit(uint256 _amount) external payable{
        require(_amount > 0, "INVALID AMOUNT.");
        balance += _amount;
    }

    function bal_inquiry() public view returns(uint256) {
        return balance;
    }
}
