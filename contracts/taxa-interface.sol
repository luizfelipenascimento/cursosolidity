// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

// ABI

interface ITaxa {
    function getTaxa() external view returns (uint256);
}