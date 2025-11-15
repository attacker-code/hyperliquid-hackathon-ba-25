import { ethers } from 'ethers';
const provider = new ethers.JsonRpcProvider("http://127.0.0.1:8545");
const wallet = new ethers.Wallet("0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80", provider);

// Direcciones con checksum válido
const tokenA = "0x000000000000000000000000000000000000dEaD";
const tokenB = "0x000000000000000000000000000000000000bEEF";

const router = new ethers.Contract(
  "0x9DA1A18AbC19387073683BD9f49c75455bd90c10",
  ["function executeArb(address,address,uint256,bytes32[],uint256) external"],
  wallet
);

async function test() {
  try {
    const path = [ethers.zeroPadValue("0x1234", 32)];
    const tx = await router.executeArb(tokenA, tokenB, 100, path, 0);
    console.log("Tx enviada:", await tx.wait());
  } catch(e) {
    console.log("Error esperado:", e.message.substring(0, 60));
  }
}

setInterval(test, 5000);