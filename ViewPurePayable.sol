// SPDX-License-Identifier: Unlicenced
pragma solidity ^0.8.13;

contract ViewPurePay {
    address payable public owner;

    constructor() payable {
        owner = payable(msg.sender);
    }

    modifier onlyOwner {
        require(owner == msg.sender);
        _;
    }

    function myBal() public view returns (uint) {
        return owner.balance;
    }

    function contractBal() public view returns (uint) {
        return address(this).balance;
    }

    function add(uint i, uint j) public pure returns (uint) {
        return i + j;
    }

    function deposit() public payable {}

    function withdraw(uint _amt) public onlyOwner {
        owner.transfer(_amt);
    }
}
