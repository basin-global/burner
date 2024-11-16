# SITUS Metadata Contract

A simple metadata contract for SITUS OG contracts.

## Deployments
with viem

### Base Mainnet
- Contract: [`0x77e8030519eb38976df64a58ffe594c8e731afc5`](https://basescan.org/address/0x77e8030519eb38976df64a58ffe594c8e731afc5)

## Implementation Details
- Returns metadata URL in format: `https://ensitus.xyz/api/metadata/{tld_address}/{token_id}`
- Uses OpenZeppelin's Strings library
- Pure function with no state changes
- Solidity version: 0.8.20
