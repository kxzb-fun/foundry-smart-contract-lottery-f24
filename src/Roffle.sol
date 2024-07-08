// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract Roffle {
    // Users should be able to enter the raffle by paying a ticket price;
    // At some point, we should be able to pick a winner out of the registered users.
    uint256 private immutable i_entranceFee;

    constructor(uint256 entranceFee) {
        i_entranceFee = entranceFee;
    }

    /**
     *
     */
    function enterRaffle() public payable {}

    /**
     *
     */
    function pickWinner() public {}

    /** Getter Function */
    function getEntranceFee() external view returns (uint256) {
        return i_entranceFee;
    }
}
