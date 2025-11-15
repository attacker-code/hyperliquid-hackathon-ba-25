pragma solidity ^0.8.20;

interface IHyperDEX {
    function swap(address pool, uint256 amountIn, uint256 minOut) external returns (uint256);
}