// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import "./priceconverter.sol";

contract fundme{
    address[] public funders;
    mapping(address => uint256) public addamnt;
    function fund() public payable {
        //it should be public ie accessible to anyone
        //the payable keyword make it payable
        //just like wallet, contract as well can hold funds
        //set min amount to fund
        //1. how to send the eth
        require(priceconverter.conversionRate(msg.value)> 50 * 1e18, "Not enough!!"); //used to access the value
        funders.push(msg.sender);
        addamnt[msg.sender]= msg.value;
        //as transactions are in wei, the 1e18 equals 1 ETH

    }
//Blockchain oracle is used to provide external data to smart contract making them HYBRID.
//as smart contract is disconnected from the outside world.
//use such data to make a contract called reference contract and other contracts use it.

//1. randomness is used using chainlink VRF using protocol like pooltogether for fairness.

//2. chainlink keepers: decentralized event driven execution: check eligibility of execution

    //for loop

    // function withdraw(params) {
        for (uint256 i=0; i<funders.length; i++) 
        {
            address funder = funders[i];
            addamnt[funder]=0;
        };
        funders = new address[](0);
        //msg.sender address is casted to payable
        //transfer: use 2300 and if exceed throw error and revert
        payable(msg.sender).transfer(address(this).balance);
        //send: use 2300 gas and return bool value 
        bool sendSuccess = payable(msg.sender).send(address(this).balance);
        require(sendSuccess,"send failed");
        //call: low level call and return 2 values
        (bool callSuccess, bytes memory dataReturned) = payable(msg.sender).call{value:address(this).balance}("");
        require(callSuccess,"call failed");

    // }
}