//SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";
import {Strings} from "@openzeppelin/contracts/utils/Strings.sol";
import {ERC404} from "erc404/ERC404.sol";
import {ERC404UniswapV2Exempt} from "erc404/extensions/ERC404UniswapV2Exempt.sol";

contract ERC404A is Ownable, ERC404, ERC404UniswapV2Exempt {
    string tokenURI1;
    string tokenURI2;
    string tokenURI3;
    string tokenURI4;
    string tokenURI5;

    constructor(
        string memory name_,
        string memory symbol_,
        uint8 decimals_,
        uint256 maxTotalSupplyERC721_,
        address initialOwner_,
        address initialMintRecipient_,
        address uniswapV2Router_
    ) ERC404(name_, symbol_, decimals_) Ownable(initialOwner_) ERC404UniswapV2Exempt(uniswapV2Router_) {
        // Do not mint the ERC721s to the initial owner, as it's a waste of gas.
        _setERC721TransferExempt(initialMintRecipient_, true);
        _mintERC20(initialMintRecipient_, maxTotalSupplyERC721_ * units);
    }

    function setTokenURIs(
        string memory tokenURI1_,
        string memory tokenURI2_,
        string memory tokenURI3_,
        string memory tokenURI4_,
        string memory tokenURI5_) external onlyOwner {
        tokenURI1 = tokenURI1_;
        tokenURI2 = tokenURI2_;
        tokenURI3 = tokenURI3_;
        tokenURI4 = tokenURI4_;
        tokenURI5 = tokenURI5_;
    }

    function setERC721TransferExempt(
        address account_,
        bool value_
    ) external onlyOwner {
        _setERC721TransferExempt(account_, value_);
    }

    function tokenURI(uint256 id) public view override returns (string memory) {
        uint8 seed = uint8(bytes1(keccak256(abi.encodePacked(id))));
        string memory targetURI;

        if (seed <= 100) {
            targetURI = tokenURI1;
        } else if (seed <= 160) {
            targetURI = tokenURI2;
        } else if (seed <= 210) {
            targetURI = tokenURI3;
        } else if (seed <= 240) {
            targetURI = tokenURI4;
        } else if (seed <= 255) {
            targetURI = tokenURI5;
        }

        return targetURI;
    }
}
