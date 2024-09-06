// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HotelRoom{

    enum Statuses {Vacent, Occupied}
    Statuses public CurrentStatus;
    address payable public owner;

    event Occupy(address _occupant, uint _value);

    constructor() {
        owner = payable(msg.sender);
        CurrentStatus = Statuses.Vacent;
    }

    modifier onlyWhileVacent{
        require(CurrentStatus==Statuses.Vacent, "Currently occupied.");
        _;
    }

    modifier value(uint _amount){
        require(msg.value >= _amount, "Not enough ether");
        _;
    }

    function book() public payable onlyWhileVacent value(2 ether){

        (bool sent, bytes memory data) = owner.call{value:msg.value}("");

        CurrentStatus = Statuses.Occupied;

        // owner.transfer(msg.value);
        emit Occupy(msg.sender, msg.value);
    }
}