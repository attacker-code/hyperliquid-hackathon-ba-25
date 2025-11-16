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
    address constant HYPERLEND = 0xb88339CB7199b77E23DB6E890353E22632Ba630f;
    address constant USDC_POOL = 0x4C7B17c8b4F3FF766889Aaf2ac5a6Db565FD61a9;
    address constant USDC = 0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48;
    
    constructor() { owner = msg.sender; }
    modifier onlyOwner() { require(msg.sender == owner, "O"); _; }
    
    function executeArb(uint256 amountIn, uint256 minProfit) external onlyOwner returns (uint256 profit) {
        uint256 balanceBefore = IERC20(USDC).balanceOf(address(this));
        IHyperLend(HYPERLEND).flashLoan(USDC, amountIn, "");
        profit = IERC20(USDC).balanceOf(address(this)) - balanceBefore;
        require(profit > minProfit, "P");
    }
}