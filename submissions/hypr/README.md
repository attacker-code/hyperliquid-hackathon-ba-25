# HYPR - HyperEVM Arbitrage Agent

Automated yield strategy that executes arbitrage between HyperEVM pools using flashloans.

## Stack
- Solidity 0.8.20
- Foundry
- Node.js + ethers.js

## Run Demo
```bash
# Terminal 1: Start Anvil
anvil --fork-url https://rpc.hyperliquid-testnet.xyz/evm
```

# Terminal 2: Deploy

```bash
forge create src/HyprRouter.sol:HyprRouter --rpc-url http://127.0.0.1:8545 --private-key 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80 --broadcast
```


# Terminal 3: Run bot

```bash
cd bot && npm install && RPC=http://127.0.0.1:8545 PK=0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80 ADDR=0xDEPLOYED_ADDRESS node simple-demo.js
```


## Architecture

HyprRouter.sol: Core arbitrage contract with flashloan integration
bot/simple-demo.js: Agent that monitors and executes opportunities every 5s