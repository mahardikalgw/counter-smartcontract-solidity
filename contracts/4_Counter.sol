// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract Example {
    address owner;

    struct Counter {
        uint number;
        string description;
    }

    Counter counter;

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can increment or decrement the counter");
        _;
    }

    constructor(uint initial_value, string memory description) {
        owner = msg.sender;
        counter = Counter(initial_value, description);
    }

    function increment_counter(string memory description) external onlyOwner {
        counter.number += 1;
        counter.description = description;
    }

    function decrement_counter(string memory description) external onlyOwner {
        counter.number -= 1;
        counter.description = description;
    }

    function get_counter_value() external view returns(uint) {
        return counter.number;
    }

    function get_value_description() external view returns(uint, string memory) {
        return (counter.number, counter.description);
    }
}