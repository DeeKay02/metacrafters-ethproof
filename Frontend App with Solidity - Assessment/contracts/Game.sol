// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Game {
    uint256 private randNo;
    address public winner;
    address public owner;

    // set creator as owner
    constructor (){
        owner = msg.sender;
    }

    // modifier that allows only owner
    modifier onlyOwner { 
        require (owner == msg.sender, "Only owner can access");
        _;
    }

    function deposit() payable public {}

    function generateRandom() public {
        uint random = uint (keccak256(abi.encodePacked(msg.sender, block.timestamp, randNo)));
        randNo = random % 10;
    }

    function claimReward() public {
        require(msg.sender == winner, "Not winner");
        (bool sent, ) = payable(msg.sender).call{value: 0.1 ether}("");
        require(sent, "Failed to send Ether");
        winner = address(0);
    }

    function guess(uint pred) public returns(bool) {
        if(pred == randNo) {
            winner = msg.sender;
            return true;
        }
        return false;
    }

    function getRandom() public onlyOwner view returns(uint) {
        return randNo;
    }

    function getBalance() public view returns(uint) {
        return address(this).balance / 1 ether;
    }
}