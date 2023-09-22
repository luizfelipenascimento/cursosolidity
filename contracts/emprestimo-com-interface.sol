// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

import "contracts/taxa-interface.sol";

contract EmprestimoComInterface {
    ITaxa taxa;

    constructor() {
        taxa = ITaxa(0xd9145CCE52D386f254917e481eB44e9943F39138);
    }

    function simulaEmprestimo(uint256 valor, uint256 risco) public view returns (uint256) {
        return valor * risco * taxa.getTaxa();
    }
}