import { ethers } from 'ethers';
const provider = new ethers.JsonRpcProvider("http://127.0.0.1:8545");
const wallet = new ethers.Wallet("0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80", provider);

const router = new ethers.Contract(
  "0x9DA1A18AbC19387073683BD9f49c75455bd90c10",
  ["function executeArb(uint256,uint256) external"],
  wallet
);

async function test() {
  try {
    const tx = await router.executeArb(ethers.parseEther("100"), ethers.parseEther("0.1"));
    console.log("Tx:", await tx.wait());
  } catch(e) {
    console.log("Error:", e.message.substring(0, 60));
  }
}

setInterval(test, 5000);