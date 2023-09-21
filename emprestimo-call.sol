// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

contract EmprestimoCall {
    address public addTaxa = 0xd9145CCE52D386f254917e481eB44e9943F39138;

    function setTaxaComCall(uint256 _val) public returns (bytes memory) {
        (bool success, bytes memory data) = addTaxa.call(abi.encodeWithSignature("setTaxaBase(unit256)", _val));
        require(success, "call failed!");
        return data;
    }

    function getTaxaViaCall() public returns (uint256) {
        (bool success, bytes memory data) = addTaxa.call(abi.encodeWithSignature("taxaBase()"));
        require(success, "call failed!");
        return abi.decode(data, (uint256));
    }
}