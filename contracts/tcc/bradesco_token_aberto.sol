// SPDX-License-Identifier: MIT

pragma solidity 0.8.19;

import "contracts/tcc/bradesco_token_aberto.sol";

// endereco do contrato na rede sepolia: 0x0882572559A3E2b4f349d4ee387902dfBa458f6c

contract Custodia {

  event EtherRecebido();

  bytes32 public hashCliente;
  ExercicioToken exercicioToken;

  constructor(string memory _nome, string memory _conta, string memory _agencia) {
    string memory dadosDoCliente = string.concat(_nome, _conta, _agencia);
    hashCliente = keccak256(bytes(dadosDoCliente));
    exercicioToken = ExercicioToken(0x89A2E711b2246B586E51f579676BE2381441A0d0);
  }

  function meuSaldo() public view returns (uint256) {
    return exercicioToken.balanceOf(address(this));
  }

  function gerarTokenParaEuCliente(uint256 quantidade) public {
    exercicioToken.mint(address(this), quantidade);
  }
  
  function transfereEther(uint256 valor, address payable recebedor) public payable {
    require(valor <= address(this).balance, "saldo insuficiente para operacao");
    recebedor.transfer(valor);
  }

  function transfereToken(uint256 valor, address payable recebedor) public payable {
    require(valor <= exercicioToken.balanceOf(address(this)), "saldo TokenExercicio insuficiente");
    recebedor.transfer(valor);
  }

  function meuSaldoEther() public view returns (uint256) {
    return address(this).balance; 
  }

  receive() external payable {
    emit EtherRecebido();
  }
}