//SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "./ArrorERC404.sol";
import { IUniswapV2Router01 } from "v2-periphery/interfaces/IUniswapV2Router01.sol";
import { IUniswapV2Factory } from "v2-core/interfaces/IUniswapV2Factory.sol";
import { IUniswapV2Pair } from "v2-core/interfaces/IUniswapV2Pair.sol";
//import { TestERC20 } from "../contracts/test/TestERC20.sol";

contract ArrorUniFactory {
    // IUniswapV2Router01 public constant UNISWAP_V2_ROUTER =
    // IUniswapV2Router01(0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D);
    // IUniswapV2Factory public constant UNISWAP_V2_FACTORY =
    // IUniswapV2Factory(0x5C69bEe701ef814a2B6a3EDD4B1652CB9cc5aA6f);
    // address public constant WETH9 = address(0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2);
    IUniswapV2Router01 public UNISWAP_V2_ROUTER; 
    IUniswapV2Factory public UNISWAP_V2_FACTORY;


    event ArrorERC404Created(address indexed newArrorERC404Address, address indexed creator);
    event ArrorERC404CreatedPair(address indexed tokenA, address indexed tokenB, address indexed pair);


    constructor(address _uniswapV2Router, address _uniswapV2Factory) {
        UNISWAP_V2_ROUTER = IUniswapV2Router01(_uniswapV2Router);
        UNISWAP_V2_FACTORY = IUniswapV2Factory(_uniswapV2Factory);
    }

    function createERC404(
        string memory name_,
        string memory symbol_,
        uint8 decimals_,
        uint256 maxTotalSupplyERC721_,
        string memory tokenURI1_,
        string memory tokenURI2_,
        string memory tokenURI3_,
        string memory tokenURI4_,
        string memory tokenURI5_,
        address tokenB_
    ) public returns (ArrorERC404 newArror, address uniPair) {
        newArror = new ArrorERC404(
            name_,
            symbol_,
            decimals_,
            maxTotalSupplyERC721_,
            address(this),
            address(this)
        );
        newArror.setTokenURIs(
            tokenURI1_,
            tokenURI2_,
            tokenURI3_,
            tokenURI4_,
            tokenURI5_
        );
        uniPair = _createPair(address(newArror), tokenB_);
        // Set the Dyson Finance as exempt.
        newArror.setERC721TransferExempt(address(UNISWAP_V2_FACTORY), true);
        newArror.setERC721TransferExempt(address(UNISWAP_V2_ROUTER), true);
        emit ArrorERC404Created(address(newArror), msg.sender);
    }

    function _createPair(address tokenA, address tokenB) internal returns (address uniPair){
        uniPair = UNISWAP_V2_FACTORY.createPair(tokenA, tokenB);
        require(uniPair != address(0), "Factory: UNIPAIR_EXISTS");
        emit ArrorERC404CreatedPair(tokenA, tokenB, uniPair);
    }
}
