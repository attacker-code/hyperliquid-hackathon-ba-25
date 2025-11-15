// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
import "forge-std/Script.sol";
import "../src/HyprRouter.sol";

contract DeployScript is Script {
    function run() external {
        uint256 pk = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(pk);
        HyprRouter router = new HyprRouter();
        console.log("Deployed:", address(router));
        vm.stopBroadcast();
    }
}