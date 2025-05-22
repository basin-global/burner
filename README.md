# Burner Contract

A simple Solidity contract that burns ERC20 tokens and rewards the caller.

## What it does

- Burns 99% of any ERC20 tokens sent to it
- Rewards the caller with 1% of the burned tokens
- If a token doesn't have a burn function, it sends the tokens to the zero address instead

## How to use

1. Send ERC20 tokens to the contract
2. Call the `burn()` function
3. You'll receive 1% of the tokens as a reward

## Features

- Safe token handling using OpenZeppelin's SafeERC20
- Protection against reentrancy attacks
- Automatic fallback to zero address if burn function isn't available

## Requirements

- Solidity ^0.8.20
- OpenZeppelin contracts
