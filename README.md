# Bananas (BNNA)

A simple ERC-20 token written in Solidity and deployed on the Sepolia testnet using Remix and MetaMask.

## Deployment

- **Contract address:** [0xB24D6fBcBc50A59112Cc431343C17A167Ec57Ef5](https://sepolia.etherscan.io/address/0xB24D6fBcBc50A59112Cc431343C17A167Ec57Ef5)
- **Transfer tx hash:** [0x86361bf359c4478ac4d224ebd77e49ceec078089c1d279350efedccfaf808058](https://sepolia.etherscan.io/tx/0x86361bf359c4478ac4d224ebd77e49ceec078089c1d279350efedccfaf808058)
- Name: Bananas, Symbol: BNNA, Supply: 1,000,000, Decimals: 18

## How it works

`SimpleToken.sol` keeps track of how many tokens each address has.

- The constructor sets the name, symbol and supply, and gives all tokens to the deployer.
- `balanceOf` checks an address's balance.
- `transfer` sends tokens to another address.
- `approve` and `transferFrom` let another address spend tokens on your behalf.

## Setup

1. Install MetaMask, switch to Sepolia, and get test ETH from a faucet.
2. Open [Remix](https://remix.ethereum.org), create `SimpleToken.sol`, and paste in the code.
3. Compile with Solidity 0.8.20 or higher.
4. In Deploy, pick Injected Provider (MetaMask) and deploy with `Bananas`, `BNNA`, `1000000`.
5. Call `transfer` to send tokens. Amounts use 18 decimals, so 10 tokens = `10000000000000000000`.
