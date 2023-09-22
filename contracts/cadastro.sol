// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

// endereco do contrato rede sepolia: 0x5DD59b5007AB64Db6b071Af0ad90DcE63676a229

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
        string memory agencia,
        string memory conta 
    ) external returns (bool) {
        string memory agenciaConta = string.concat(agencia, conta);
        bytes memory bytesAgenciaConta = bytes(agenciaConta);
        bytes32 hashTemp = keccak256(bytesAgenciaConta);
        
        Custodia custodia = new Custodia(hashTemp);

        Cliente memory cliente = Cliente(totalCliente, _nome, _sobrename, payable(address(custodia)), hashTemp, true);

        clientes.push(cliente);
        
        totalCliente++;

        return true;
    }

    function getClientePeloId(uint256 _id) public view returns (Cliente memory, bool) {
        Cliente memory cliente = clientes[_id];
        return (cliente, cliente.existe);
    }

}

contract Custodia {

    bytes32 public hashClient;

    event EtherRecebido();

    constructor(bytes32 _hashClient) {
        hashClient = _hashClient;
    }

    receive() external payable {
        emit EtherRecebido();
    }
}