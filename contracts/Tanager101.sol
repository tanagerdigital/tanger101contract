// SPDX-License-Identifier: MIT

pragma solidity ^0.8.17;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/security/ReentrancyGuard.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract Tanager101 is ERC721URIStorage, ReentrancyGuard, Ownable {
    bool public mintStart;
    uint256 public totalSupply;
    uint256 public constant maxSupply = 100;
    string public baseURI;

    constructor() ERC721("Tanager101", "T101") {}

    function _baseURI() internal view virtual override returns (string memory) {
        return baseURI;
    }

    function  changeBaseURI(string memory _uri) public onlyOwner {
      baseURI = _uri;
    }

    function setStart(bool _isStart) public onlyOwner {
        mintStart = _isStart;
    }

    function mint() public nonReentrant {
        require(totalSupply < maxSupply, "reach limit");
        _mint(msg.sender, ++totalSupply);
    }

    function airdrop(address[] memory _droplist) public onlyOwner {
        for(uint256 i = 0; i < _droplist.length; i++){
          _mint(_droplist[i], ++totalSupply);
        }
    }
}
