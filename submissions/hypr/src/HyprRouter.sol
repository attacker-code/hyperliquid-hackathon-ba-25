// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
import "./interfaces/IHyperLend.sol";
import "./interfaces/IHyperDEX.sol";

interface IERC20 {
    function balanceOf(address) external view returns (uint256);
    function transfer(address, uint256) external;
}

contract HyprRouter {
    address public owner;
    address constant LEND = 0x0000000000000000000000000000000000000001;
    address constant DEX = 0x0000000000000000000000000000000000000002;
    
    constructor() { owner = msg.sender; }
    modifier onlyOwner() { require(msg.sender == owner, "O"); _; }
    
    function executeArb(address tokenA, address tokenB, uint256 amountIn, bytes32[] calldata path, uint256 minProfit) external onlyOwner returns (uint256 profit) {
        uint256 balanceBeforeA = IERC20(tokenA).balanceOf(address(this));
        IHyperLend(LEND).flashLoan(tokenA, amountIn, "");
        uint256 borrowed = IERC20(tokenA).balanceOf(address(this)) - balanceBeforeA;
        
        uint256 balanceBeforeB = IERC20(tokenB).balanceOf(address(this));
        for (uint256 i = 0; i < path.length; i++) {
            (address pool, bool zeroToOne) = (address(uint160(uint256(path[i]))), uint256(path[i])>>160 == 1);
            IHyperDEX(DEX).swap(pool, borrowed, 0);
        }
        profit = IERC20(tokenB).balanceOf(address(this)) - balanceBeforeB;
        require(profit > minProfit, "P");
        IERC20(tokenA).transfer(LEND, borrowed);
    }
}