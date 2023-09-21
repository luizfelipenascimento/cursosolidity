// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

contract Cadastro {
    struct Cliente {
        uint256 id;
        string nome;
        string sobrenome;
        address payable endereco;
        bytes32 hashConta;
        bool existe;
    }

    uint256 public totalCliente;

    Cliente[] clientes; 

    function addClient(
        string memory _nome, 
        string memory _sobrename,
        address payable _endereco,
        string memory agencia,
        string memory conta 
    ) external returns (bool) {
        string memory agenciaConta = string.concat(agencia, conta);
        bytes memory bytesAgenciaConta = bytes(agenciaConta);
        bytes32 hashTemp = keccak256(bytesAgenciaConta);
        Cliente memory cliente = Cliente(totalCliente, _nome, _sobrename, _endereco, hashTemp, true);

        clientes.push(cliente);
        
        return true;
    }

    function getClientePeloId(uint256 _id) public view returns (Cliente memory, bool) {
        Cliente memory cliente = clientes[_id];
        return (cliente, cliente.existe);
    }

}