// SPDX-License-Identifier: Unlicenced
pragma solidity ^0.8.13;

contract ErrorHandling {
    address payable internal owner;

    constructor() payable {
        owner = payable(msg.sender);
    }

    modifier onlyOwner {
        require(owner == msg.sender);
        _;
    }

    function contractBal() public view returns (uint) {
        return address(this).balance;
    }

    function deposit() public payable {
        if(msg.value < 0.1 ether) {
            revert("Deposit should be more than 0.1 ETH");
        }
    }

    function withdraw(uint _amt) public onlyOwner {
        assert(_amt > 2 ether);
        owner.transfer(_amt);
    }
}