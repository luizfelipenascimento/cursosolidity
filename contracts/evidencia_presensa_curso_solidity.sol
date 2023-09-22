// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts@4.9.3/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts@4.9.3/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts@4.9.3/access/Ownable.sol";
import "@openzeppelin/contracts@4.9.3/utils/Counters.sol";

// endereco do contrato: 0x6608b20Fe41e8c5c9D2800bB6B5912888c9546F3

contract EvidenciaPresencaCursoSolidity is ERC721, ERC721URIStorage, Ownable {
    using Counters for Counters.Counter;

    Counters.Counter private _tokenIdCounter;

    mapping(uint256 => string) private tokenHashes;

    constructor() ERC721("Evidencia Presenca Curso Solidity", "EPCS") {
        _tokenIdCounter.increment();
    }

    function _baseURI() internal pure override returns (string memory) {
        return "https://luizfelipenascimento.github.io/nft-cursosolidity/";
    }

    function safeMint(address to, string memory uri, string memory tokenHash) public onlyOwner {
        uint256 tokenId = _tokenIdCounter.current();
        _tokenIdCounter.increment();
        _safeMint(to, tokenId);
        tokenHashes[tokenId] = tokenHash;
        _setTokenURI(tokenId, uri);
    }

    // The following functions are overrides required by Solidity.

    function _burn(uint256 tokenId) internal override(ERC721, ERC721URIStorage) {
        super._burn(tokenId);
    }

    function tokenURI(uint256 tokenId)
        public
        view
        override(ERC721, ERC721URIStorage)
        returns (string memory)
    {
        return string.concat(super.tokenURI(tokenId), ".json");
    }

    function getTokenHash(uint256 tokenId) public view returns(string memory)  {
        return tokenHashes[tokenId];
    } 

    function supportsInterface(bytes4 interfaceId)
        public
        view
        override(ERC721, ERC721URIStorage)
        returns (bool)
    {
        return super.supportsInterface(interfaceId);
    }
}
