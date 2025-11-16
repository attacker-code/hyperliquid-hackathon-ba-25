pragma solidity ^0.8.20;
import "forge-std/Test.sol";
import "../src/HyprRouter.sol";

contract HyprRouterArbTest is Test {
    HyprRouter router;
    
    function setUp() public {
        router = new HyprRouter();
    }
    
    function test_arbExecution() public {
        // Nuevo: solo 2 parámetros
        vm.expectRevert();
        router.executeArb(1000, 0);
    }
}