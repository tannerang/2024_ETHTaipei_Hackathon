//SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";
import {Strings} from "@openzeppelin/contracts/utils/Strings.sol";
import {ERC404} from "erc404/ERC404.sol";

contract ArrorERC404 is Ownable, ERC404 {
  string public baseTokenURI;

  constructor(
    string memory name_,
    string memory symbol_,
    uint8 decimals_,
    uint256 maxTotalSupplyERC721_,
    address initialOwner_,
    address initialMintRecipient_
  ) ERC404(name_, symbol_, decimals_) Ownable(initialOwner_) {
    // Do not mint the ERC721s to the initial owner, as it's a waste of gas.
    _setERC721TransferExempt(initialMintRecipient_, true);
    _mintERC20(initialMintRecipient_, maxTotalSupplyERC721_ * units);

  }

  function tokenURI(uint256 id_) public pure override returns (string memory) {
    return string.concat("https://example.com/token/", Strings.toString(id_));
  }

  function setTokenURI(string memory _tokenURI) external onlyOwner {
    baseTokenURI = _tokenURI;
  }

  function setERC721TransferExempt(
    address account_,
    bool value_
  ) external onlyOwner {
    _setERC721TransferExempt(account_, value_);
  }
}
