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
