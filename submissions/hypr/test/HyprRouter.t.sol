pragma solidity ^0.8.20;
import "forge-std/Test.sol";
import "../src/HyprRouter.sol";

contract HyprRouterTest is Test {
    HyprRouter router;
    function setUp() public {
        router = new HyprRouter();
    }
    function test_deploy() public {
        assertTrue(address(router) != address(0));
    }
}