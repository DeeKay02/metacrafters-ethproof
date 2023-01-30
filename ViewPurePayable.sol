// SPDX-License-Identifier: Unlicenced
pragma solidity ^0.8.13;

contract ViewPurePay {
    address payable internal owner;

    constructor() payable {
        owner = payable(msg.sender);
    }

    modifier onlyOwner {
        require(owner == msg.sender);
        _;
    }

    function myBal() internal view returns (uint) {
        return owner.balance;
    }

    function contractBal() internal view returns (uint) {
        return address(this).balance;
    }

    function add(uint i, uint j) internal pure returns (uint) {
        return i + j;
    }

    function deposit() public payable {}

    function withdraw(uint _amt) internal onlyOwner {
        owner.transfer(_amt);
    }
}
