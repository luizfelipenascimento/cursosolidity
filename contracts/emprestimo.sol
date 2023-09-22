// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

import "contracts/taxa.sol";
import "contracts/cadastro.sol";

contract EmprestimoComImport {
    Taxa taxa; 
    Cadastro cadastro;

    constructor() {
        taxa = Taxa(0xd9145CCE52D386f254917e481eB44e9943F39138);
        cadastro = Cadastro(0x7EF2e0048f5bAeDe046f6BF797943daF4ED8CB47);
    }

    function simulaEmprestimo(uint256 valor, uint256 _idCliente) public view returns (uint256) {
        (Cadastro.Cliente memory cliente, bool existe) = cadastro.getClientePeloId(_idCliente);
        require(existe, "Cliente nao existe");
        uint256 risco = cliente.id;
        return valor * risco * taxa.getTaxa();
    }

    function ajustaTaxa(uint256 _novaTaxa) external returns (bool) {
        taxa.setTaxa(_novaTaxa);
        return true;
    }
}