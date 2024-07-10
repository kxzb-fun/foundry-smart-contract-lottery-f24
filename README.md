# Foundry Smart Contrcat Lootery

this is a sample contract Roffle.

## Lesson 4: Creating custom errors

- changed the visibility from public to external. External is more gas efficient
- Raffle__NotEnoughEthSent(),using the Raffle__ prefix

```solidity
require(msg.value >= i_entranceFee, "Not enough ETH sent");
```

Note: The require statement is used to enforce certain conditions at runtime. If the condition specified in the require statement evaluates to false, the transaction is reverted, and any changes made to the state within that transaction are undone. This is useful for ensuring that certain prerequisites or validations are met before executing further logic in a smart contract.

```solidity
if (msg.value < i_entranceFee) {
    revert Raffle__NotEnoughEthSent();
}
```

this is not readable, but more gas-efficient than this way `require(msg.value >= i_entranceFee, "Not enough ETH send!");`

this is the most gas-efficient in new solidity version 0.8.26

```solidity
require(msg.value >= i_entranceFee,Raffle__SendMoreEthToEnterRoffle());
```

## 5. Smart contracts events

1. Makes migration easier
2. Makes front end "indexing" easier

<https://docs.soliditylang.org/en/v0.8.25/contracts.html#events>

### Purpose of Events

1. Logging: Events are primarily used for logging significant actions in your smart contract. These logs are stored on the blockchain.
2. Interfacing with Frontend: Events can be used to notify a frontend application of specific occurrences, such as a new player entering the raffle.
3. Gas Efficiency: Events are more gas-efficient for storing data compared to writing data to storage variables.

## 6. Random numbers - Block Timestamp

<https://solidity-by-example.org/hacks/block-timestamp-manipulation/>

## Lesson 7: Random numbers - Introduction to Chainlink VRF

### Introduction to Chainlink VRF

Chainlink VRF (Verifiable Random Function) is a service provided by the Chainlink network that offers secure and verifiable randomness to smart contracts on blockchain platforms. This randomness is crucial for our Raffle and for any other applications that need a source of randomness. How does Chainlink VRF work?

Chainlink VRF provides randomness in 3 steps:

1. Requesting Randomness: A smart contract makes a request for randomness by calling the requestRandomness function provided by the Chainlink VRF. This involves sending a request to the Chainlink oracle along with the necessary fees.
2. Generating Randomness: The Chainlink oracle node generates a random number off-chain using a secure cryptographic method. The oracle also generates a proof that this number was generated in a verifiable manner.
3. Returning the Result: The oracle returns the random number along with the cryptographic proof to the smart contract. The smart contract can then use the random number, and any external observer can verify the proof to confirm the authenticity and integrity of the randomness.

## Lesson 8: Implement the Chainlink VRF

<https://docs.chain.link/vrf/v2-5/getting-started>

[Open in Remix](https://remix.ethereum.org/#url=https://docs.chain.link/samples/VRF/v2-5/VRFD20.sol&autoCompile=true)

Install

[Github repo](https://github.com/smartcontractkit/chainlink-brownie-contracts)

```shell
forge install smartcontractkit/chainlink-brownie-contracts --no-commit
```

Use 1.1.1 version

```shell
forge install smartcontractkit/chainlink-brownie-contracts@1.1.1 --no-commit
```

How to inhert construct paramers

`VRFConsumerBaseV2Plus(vrfCoordinator)`

```solidity
contract Roffle is VRFConsumerBaseV2Plus {
    // some code here ...
    constructor(
        uint256 entranceFee,
        uint256 interval,
        address vrfCoordinator
    ) VRFConsumerBaseV2Plus(vrfCoordinator) {
        i_entranceFee = entranceFee;
        i_interval = interval;
        s_lastedTimeStamp = block.timestamp;
    }
    //some code here ...
}
```

## Lesson 9. Implementing Vrf Fulfil

## Lesson 10. The modulo operation

## Lesson 11: Implementing the lottery state - Enum

## Lesson 12: Lottery restart - Resetting an Array

## Lesson 13: Important: Note on learning by building

## Lesson 14: The CEI method - Checks, Effects, Interactions

The Checks-Effects-Interactions (CEI) Pattern

A very important thing to note. When developing this contract Patrick is using a style called Checks-Effects-Interactions or CEI.

The Checks-Effects-Interactions pattern is a crucial best practice in Solidity development aimed at enhancing the security of smart contracts, especially against re-entrancy attacks. This pattern structures the code within a function into three distinct phases:

- Checks: Validate inputs and conditions to ensure the function can execute safely. This includes checking permissions, input validity, and contract state prerequisites.
- Effects: Modify the state of our contract based on the validated inputs. This phase ensures that all internal state changes occur before any external interactions.
- Interactions: Perform external calls to other contracts or accounts. This is the last step to prevent reentrancy attacks, where an external call could potentially call back into the original function before it completes, leading to unexpected behavior. (More about reentrancy attacks on a later date)

## Lesson 15: Introduction to Chainlink Automation
