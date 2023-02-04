// SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;

contract Twocalled {
    uint public sum;
    address public sender;
    uint public value;

    function addsetVars(uint a, uint b) public payable {
        sum = a + b;
        sender = msg.sender;
        value = msg.value;
    }
}

contract OneCall {
    uint public sum;
    address public sender;
    uint public value;

    function addsetVars(address _contract, uint a, uint b) public payable {
        // OneCall's storage is set, Twocall is not modified.
        (bool success, bytes memory data) = _contract.delegatecall(
            abi.encodeWithSignature("addsetVars(uint256,uint256)", a, b)
        );
    }
}