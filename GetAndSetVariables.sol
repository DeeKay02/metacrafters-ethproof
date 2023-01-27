// SPDX-License-Identifier: Unlicenced
pragma solidity ^0.8.15;

contract SetGetStateVar {
    uint var1int;
    address var2add;
    bool var3bool;
    bytes1 var4byte;

    function set(uint intvar, address addvar, bool boolvar, bytes1 bytevar) public {
        var1int = intvar;
        var2add = addvar;
        var3bool = boolvar;
        var4byte = bytevar;
    }

    function get() public view returns(uint, address, bool, bytes1) {
        return (var1int, var2add, var3bool, var4byte);
    }
}