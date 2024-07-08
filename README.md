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
