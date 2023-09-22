// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

contract Taxa {
    uint256 public taxaBase = 1;

    function setTaxa(uint256 _novaTaxaBase) public returns (uint256) {
        taxaBase = _novaTaxaBase; 
        return taxaBase;
    }

    function getTaxa() public view returns (uint256) {
        return taxaBase;
    }
}