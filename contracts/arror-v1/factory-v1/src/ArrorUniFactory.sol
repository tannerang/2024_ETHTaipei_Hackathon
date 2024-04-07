//SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import { ERC404A } from "./ERC404-A.sol";
import { IUniswapV2Router02 } from "v2-periphery/interfaces/IUniswapV2Router02.sol";
import { IUniswapV2Factory } from "v2-core/interfaces/IUniswapV2Factory.sol";
import { IUniswapV2Pair } from "v2-core/interfaces/IUniswapV2Pair.sol";

contract ArrorUniFactory {
    IUniswapV2Router02 public UNISWAP_V2_ROUTER; 
    IUniswapV2Factory public UNISWAP_V2_FACTORY;

    event ArrorERC404Created(address indexed newArrorERC404Address, address indexed creator);
    event ArrorERC404CreatedPair(address indexed tokenA, address indexed tokenB, address indexed pair);
    event ArrorERC404AddLiquidityETH(address indexed newArrorERC404Address, address indexed factory, uint indexed amount);

    constructor(address _uniswapV2Router, address _uniswapV2Factory) {
        UNISWAP_V2_ROUTER = IUniswapV2Router02(_uniswapV2Router);
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
        address tokenB_,
        uint256 amountA
    ) public payable returns (ERC404A newArror, address uniswapV2Pair) {
        newArror = new ERC404A(
            name_,
            symbol_,
            decimals_,
            maxTotalSupplyERC721_,
            address(this),
            address(this),
            address(UNISWAP_V2_ROUTER)
        );
        newArror.setTokenURIs(
            tokenURI1_,
            tokenURI2_,
            tokenURI3_,
            tokenURI4_,
            tokenURI5_
        );
        uniswapV2Pair = _createPair(address(newArror), tokenB_);
        // Set some addresses as exempt.
        /*
        newArror.setERC721TransferExempt(address(UNISWAP_V2_FACTORY), true);
        newArror.setERC721TransferExempt(address(UNISWAP_V2_ROUTER), true);
        */
        newArror.setERC721TransferExempt(uniswapV2Pair, true);
        
        emit ArrorERC404Created(address(newArror), msg.sender);

        // Add liquidity
        _addLiquidityETH(newArror, amountA);
    }

    function _createPair(address tokenA, address tokenB) internal returns (address uniswapV2Pair){
        uniswapV2Pair = UNISWAP_V2_FACTORY.createPair(tokenA, tokenB);
        require(uniswapV2Pair != address(0), "Factory: UNISWAPV2PAIR_EXISTS");
        emit ArrorERC404CreatedPair(tokenA, tokenB, uniswapV2Pair);
    }

    function _addLiquidityETH(ERC404A newArror, uint256 amountA) internal {
        newArror.erc20Approve(address(UNISWAP_V2_ROUTER), newArror.erc20TotalSupply());
        UNISWAP_V2_ROUTER.addLiquidityETH{value: msg.value}(
            address(newArror),
            amountA,
            0,
            0,
            msg.sender,
            (block.timestamp + 9999999)
        );
        emit ArrorERC404AddLiquidityETH(address(newArror), address(this), 1 * 10 ** newArror.decimals());
    }
}
