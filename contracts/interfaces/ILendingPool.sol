// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

interface ILendingPool {

    event LockCreated(
        address indexed account,
        address indexed asset,
        string symbol,
        uint256 amount,
        uint256 dstChainId
    );
    
    function deposit(address asset, uint256 amount) external;

    function withdraw(address asset, uint256 amount) external returns (uint256);

    function borrow(address asset, uint256 amount) external;

    function repay(address asset, uint256 amount) external;

    function healthFactorOf(address user) external view returns (uint256);

    function initReserve(address reserve, address creditToken, address debtToken) external;

    function liquidationCall(address collateral, address debt, address user, uint256 debtToCover) external;

    function chainsight() external view returns (address);

    // return actualDebtToLiquidate
    function liquidationCallByChainsight(address collateral, address debt, address user, uint256 debtToCover, address onBehalfOf) external returns(uint256);

    function assetAddresses(string memory symbol) external returns (address);

    function creditTokenAddress(address asset) external returns (address);
    function debtTokenAddress(address asset) external returns (address);

    function lockFor(address asset, uint256 amount, uint256 dstChainId) external;

    // returns amount of underlying token of debt asset needed to liquidate debt 
    function amountNeededToLiquidate(address collateral, address debt, address user, uint256 debtToCover) external returns (uint256);
}
