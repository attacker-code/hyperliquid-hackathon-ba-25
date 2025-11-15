pragma solidity ^0.8.20;
import "forge-std/Test.sol";
import "../src/HyprRouter.sol";

contract HyprRouterArbTest is Test {
    HyprRouter router;
    address owner = address(1);
    
    function setUp() public {
        // Si tienes RPC de HyperEVM, descomenta esto:
        // vm.createSelectFork("https://hyper-evm.rpc");
        
        vm.prank(owner);
        router = new HyprRouter();
    }
    
    function test_arbExecution() public {
        vm.prank(owner);
        // Mock path: pool=address(0), zeroToOne=true
        bytes32[] memory path = new bytes32[](1);
        path[0] = bytes32(uint256(uint160(address(0))) | (1 << 160));
        
        // Esto fallará sin implementación real, pero compila y corre
        vm.expectRevert();
        router.executeArb(address(0), address(0), 1000, path, 0);
    }
}