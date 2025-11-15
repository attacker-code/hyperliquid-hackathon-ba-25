pragma solidity ^0.8.20;

interface IHyperLend {
    function flashLoan(address token, uint256 amount, bytes calldata data) external;
}