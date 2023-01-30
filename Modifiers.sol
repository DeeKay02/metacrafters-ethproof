// SPDX-License-Identifier: Unlicenced
pragma solidity >=0.7.0 <0.9.0;

contract Calculator{

    uint a;
    uint b;
    address owner;

    constructor(){
        owner = msg.sender;
    }

    modifier onlyOwner { 
        require (owner == msg.sender, "only owner can access");
        _;
    }

    function set (uint _a, uint _b) public onlyOwner{
        a = _a;
        b = _b;
    }

    function add() public view onlyOwner returns(uint){
        return a+b;
    }

    function sub() public view onlyOwner returns(uint){
        return a-b;
    }

    function mul() public view onlyOwner returns(uint){
        return a*b;
    }

    function div() public view onlyOwner returns(uint){
        return a/b;
    }
}
