// SPDX-License-Identifier: MIT

pragma solidity 0.8.19;

import "tcc/bradesco_token_aberto.sol";

contract Custodia {



  bytes32 public hashCliente;// SPDX-License-Identifier: MIT

pragma solidity 0.8.19;

import "contracts/tcc/bradesco_token_aberto.sol";

contract Custodia {

  string public hashCliente;
  ExercicioToken exercicioToken;

  constructor(string memory _hashCliente) {
    hashCliente = _hashCliente;
    exercicioToken = ExercicioToken(0x89A2E711b2246B586E51f579676BE2381441A0d0);
  }

  function meuSaldo() public view returns (uint256) {
    return exercicioToken.balanceOf(address(this));
  }

  function gerarTokenParaEuCliente(uint256 quantidade) public {
    exercicioToken.mint(address(this), quantidade);
  }
  
  //foi utilizado a contacao de ether para real no dia 21/09/23 18:20
  function converteTokenToEther() public view returns (uint256) {
    uint256 saldo = exercicioToken.balanceOf(address(this));
    uint256 centavos = saldo % 100; 
    return converteParaEther(saldo / 100) + converteParaEther(centavos) / 100;
  }

  function TransfereEther(uint256 quantidade) public payable {
    converteTokenToEther();
    require(payable(address(this)).balance >= quantidade, "saldo insuficiente");
    payable(address(this)).transfer(quantidade);
  }

  function converteParaEther(uint256 valor) private pure returns (uint256) {
    return valor * 13 * 10**13;
  }

}

  constructor(bytes32 _hashCliente) {
    hashCliente = _hashCliente;
  }
}