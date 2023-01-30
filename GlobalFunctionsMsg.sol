// SPDX-License-Identifier: Unlicenced
pragma solidity ^0.8.13;

contract GlobalFunctions {

    mapping(address => uint) public ledger;
    constructor() payable {}
    
    function deposit() public payable {
        ledger[msg.sender] = msg.value;
    }
}