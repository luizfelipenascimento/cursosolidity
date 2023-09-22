// SPDX-License-Identifier: MIT

pragma solidity 0.8.19;

contract Custodia {
    string public hashContaCliente;

    constructor (string memory _hashContaCliente) {
        hashContaCliente = _hashContaCliente;
    }
    
}