import { ethers } from 'ethers';
const RPC = process.env.RPC!;
const PK = process.env.PK!;
const ADDR = process.env.ADDR!;
const abi = ["function executeArb(address,address,uint256,bytes32[],uint256) external"];
const wallet = new ethers.Wallet(PK, new ethers.JsonRpcProvider(RPC));
const c = new ethers.Contract(ADDR, abi, wallet);
setInterval(async () => {
  try {
    const tx = await c.executeArb("0xA","0xB",ethers.parseEther("100"),[ethers.zeroPadValue("0xPool",32)],ethers.parseEther("1"));
    console.log(await tx.wait());
  } catch(e) { console.error("Fail:",e.message); }
}, 5000);