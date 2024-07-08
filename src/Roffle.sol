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
    // @dev The duration in the lottory in seconds
    uint256 private immutable i_interval;
    address payable[] s_player;
    uint256 private s_lastedTimeStamp;

    /* EVENTS */
    event RoffleEntered(address indexed player);

    constructor(uint256 entranceFee, uint256 interval) {
        i_entranceFee = entranceFee;
        i_interval = interval;
        s_lastedTimeStamp = block.timestamp;
    }

    function enterRaffle() external payable {
        if (msg.value < i_entranceFee) {
            revert Raffle__SendMoreEthToEnterRoffle();
        }

        s_player.push(payable(msg.sender));
        emit RoffleEntered(msg.sender);
    }

    /**
     * 1. Get a random number
     * 2. Use the random number to pick a player
     * 3. Be automatically called
     */
    function pickWinner() external view {
        if ((block.timestamp - s_lastedTimeStamp) > i_interval) {
            revert();
        }
    }

    /** Getter Function */
    function getEntranceFee() external view returns (uint256) {
        return i_entranceFee;
    }
}
