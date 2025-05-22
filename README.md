# Burner Contract

A smart contract that burns 99% of held ERC20 tokens and rewards the caller with 1%.

## Deployed Contract

- **Network:** Base Mainnet
- **Contract Address:** `0x9f476025aec83e91ebc09ecfb0654391f7f14e59`
- **Verified on Basescan:** [View Contract](https://basescan.org/address/0x9f476025aec83e91ebc09ecfb0654391f7f14e59)

## Features

- Burns 99% of held ERC20 tokens
- Rewards caller with 1% of tokens
- If token has no burn function, sends to zero address instead
- Includes reentrancy protection
- Uses SafeERC20 for secure token transfers

## Development

```bash
# Install dependencies
npm install

# Compile contracts
npx hardhat compile

# Deploy to Base Mainnet
npx hardhat run scripts/deploy.js --network baseMainnet

# Verify contract
npx hardhat verify --network baseMainnet <CONTRACT_ADDRESS>
```

## What it does

- Burns 99% of any ERC20 tokens sent to it
- Rewards the caller with 1% of the burned tokens
- If a token doesn't have a burn function, it sends the tokens to the zero address instead

## How to use

1. Send ERC20 tokens to the contract
2. Call the `burn()` function
3. You'll receive 1% of the tokens as a reward

## Checking Token Balances

You can check the contract's token balances in two ways:

1. **Using the Contract:**
   - Go to [Basescan](https://basescan.org/address/0x9f476025aec83e91ebc09ecfb0654391f7f14e59)
   - Click "Read Contract"
   - Use the `checkBalance` function by inputting any ERC20 token address
   - This will show both the total balance and the reward amount (1%)

2. **Using Token Tracker:**
   - Go to [Basescan](https://basescan.org/address/0x9f476025aec83e91ebc09ecfb0654391f7f14e59)
   - Click "Token Tracker" tab
   - This shows all ERC20 tokens that have been sent to the contract

## Requirements

- Solidity ^0.8.20
- OpenZeppelin contracts
