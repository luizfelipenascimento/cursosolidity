// SPDX-License-Identifier: MIT

pragma solidity 0.8.19;

contract CustodiaExemplo {
    string public hashContaCliente;

    constructor (string memory _hashContaCliente) {
        hashContaCliente = _hashContaCliente;
    }
    
}