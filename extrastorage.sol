// SPDX-License-Identifier: MIT 

pragma solidity ^0.8.7;

import "./simplestorage.sol";

contract extrastorage is SimpleStorage{
//we can override functions in parent class/contract
//lets override store function
// to do so, 1. make function in parent contract "virtual" 2. use "override keyword in child"
function store(uint _favouriteNumber) public override {
    favoriteNumber = _favouriteNumber +5;
}
}