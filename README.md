# Bananas (BNNA) – Simple ERC-20 Token on Sepolia

A basic ERC-20 token written in Solidity, compiled and deployed with Remix IDE, and tested on the Ethereum **Sepolia** test network using MetaMask.

> This token exists only on the Sepolia testnet and has no real-world value.

## Deployment details

| Item | Value |
|---|---|
| Token name | Bananas |
| Symbol | BNNA |
| Decimals | 18 |
| Initial supply | 1,000,000 BNNA |
| Network | Ethereum Sepolia (chain ID 11155111) |
| Contract address | [`0xB24D6fBcBc50A59112Cc431343C17A167Ec57Ef5`](https://sepolia.etherscan.io/address/0xB24D6fBcBc50A59112Cc431343C17A167Ec57Ef5) |
| Deployment tx hash | [`0xbe990a5240e284f7f3481f565ea92344d079d8fac78786760f603e195e01edb4`](https://sepolia.etherscan.io/tx/0xbe990a5240e284f7f3481f565ea92344d079d8fac78786760f603e195e01edb4) |
| Token transfer tx hash (10 BNNA) | [`0x86361bf359c4478ac4d224ebd77e49ceec078089c1d279350efedccfaf808058`](https://sepolia.etherscan.io/tx/0x86361bf359c4478ac4d224ebd77e49ceec078089c1d279350efedccfaf808058) |

## Repository contents

| File | Description |
|---|---|
| `SimpleToken.sol` | The Solidity source code of the Bananas ERC-20 token |
| `README.md` | This file: project overview and setup instructions |

## How the contract works

The contract is like a shared notebook stored on the blockchain that records how many tokens each address owns.

- **Constructor**: runs once at deployment. It sets the token's **name**, **symbol** and **initial supply**, and gives the entire supply to the deployer's address.
- **`balanceOf(address)`**: returns how many tokens an address holds.
- **`transfer(to, value)`**: moves tokens from the caller to another address. It fails if the caller doesn't have enough tokens.
- **`approve(spender, value)`**: lets another address (`spender`) spend up to `value` tokens on the owner's behalf.
- **`allowance(owner, spender)`**: shows how many tokens a spender is still allowed to use.
- **`transferFrom(from, to, value)`**: used by an approved spender to move tokens from the owner to someone else.
- **Events**: `Transfer` and `Approval` are emitted so wallets and Etherscan can track activity.

Amounts use 18 decimals, like ETH, so **1 BNNA = 1,000,000,000,000,000,000** smallest units. For example, to send 10 BNNA you enter `10000000000000000000`.

## Setup instructions

### Prerequisites
- Google Chrome with the [MetaMask extension](https://chromewebstore.google.com/detail/metamask/nkbihfbeogaeaoehlefnkodbefgpgknn)
- Some free Sepolia test ETH from a faucet, e.g. the [Google Cloud Sepolia faucet](https://cloud.google.com/application/web3/faucet/ethereum/sepolia)

### Steps
1. **Set up MetaMask**: create a wallet, enable *Show test networks*, and switch to **Sepolia**. Create a second account for testing transfers.
2. **Get test ETH**: paste your wallet address into the faucet and request Sepolia ETH.
3. **Open Remix**: go to [remix.ethereum.org](https://remix.ethereum.org), create `contracts/SimpleToken.sol`, and paste in the code from this repo.
4. **Compile**: open the *Solidity Compiler* tab, use version **0.8.20 or higher**, and click *Compile SimpleToken.sol*.
5. **Deploy**: in *Deploy & Run Transactions*, choose **Injected Provider – MetaMask** (connected to Sepolia), enter the constructor values below, click **Deploy**, and confirm in MetaMask.
   - `_name`: `Bananas`
   - `_symbol`: `BNNA`
   - `_initialSupply`: `1000000`
6. **Test a transfer**: under *Deployed Contracts*, call `transfer` with the second account's address and `10000000000000000000` (10 BNNA). Confirm in MetaMask.
7. **Verify balances**: call `balanceOf` for both accounts. The sender shows 999,990 BNNA and the receiver shows 10 BNNA.
8. **Check on Etherscan**: search the contract address on [sepolia.etherscan.io](https://sepolia.etherscan.io) to see the deployment and the transfer.

## Test results

- Deployer (`0x9d76429C12b1560624f07fB314E5816C39B3E456`) received 1,000,000 BNNA at deployment.
- 10 BNNA were transferred to the second wallet (`0x869f2EFa...4604d89f8`).
- Final balances: deployer **999,990 BNNA**, second wallet **10 BNNA**.
- Etherscan shows **2 holders** and **2 transfers** for the token.

## Security note

Only Sepolia test ETH was used. No private keys or recovery phrases are stored in this repository. Never share yours.
