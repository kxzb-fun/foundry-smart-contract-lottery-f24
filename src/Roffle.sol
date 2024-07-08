// Layout of the contract file:
// version
// imports
// errors
// interfaces, libraries, contract
// Inside Contract:
// Type declarations
// State variables
// Events
// Modifiers
// Functions
// Layout of Functions:
// constructor
// receive function (if exists)
// fallback function (if exists)
// external
// public
// internal
// private
// internal & private view & pure functions
// external & public view & pure functions

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

// Raffle__NotEnoughEthSent()

/**
 * @title A sample Roffle contract
 * @author kxzb.fun
 * @notice
 * @dev Implemets Chainlink VRFv2.5
 */
contract Roffle {
    /* ERRORS */
    error Raffle__SendMoreEthToEnterRoffle();

    // Users should be able to enter the raffle by paying a ticket price;
    // At some point, we should be able to pick a winner out of the registered users.
    uint256 private immutable i_entranceFee;
    address payable[] s_player;

    /* EVENTS */
    event RoffleEntered(address indexed player);

    constructor(uint256 entranceFee) {
        i_entranceFee = entranceFee;
    }

    function enterRaffle() public payable {
        if (msg.value < i_entranceFee) {
            revert Raffle__SendMoreEthToEnterRoffle();
        }

        s_player.push(payable(msg.sender));
        emit RoffleEntered(msg.sender);
    }

    function pickWinner() public {}

    /** Getter Function */
    function getEntranceFee() external view returns (uint256) {
        return i_entranceFee;
    }
}
