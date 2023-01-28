// SPDX-License-Identifier: Unlicenced
pragma solidity ^0.8.15;

contract WeiGweiEther {
    uint inWei;
    uint inGwei;
    uint inEther;

    function setEther(uint eth_inp) public {
        inEther = eth_inp;
        inWei = eth_inp * 1 ether;
        inGwei = eth_inp * 1 gwei;
    }

    function getValues() public view returns(uint, uint, uint) {
        return(inEther, inGwei, inWei);
    }
}