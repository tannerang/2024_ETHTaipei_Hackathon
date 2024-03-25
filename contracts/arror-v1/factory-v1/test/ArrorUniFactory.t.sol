// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.21;

import {Test, console2} from "forge-std/Test.sol";
import {ArrorUniFactory} from "../src/ArrorUniFactory.sol";
import {ArrorERC404} from "../src/ArrorERC404.sol";
import {IUniswapV2Factory} from "contracts/interfaces/IUniswapV2Factory.sol";
import {IUniswapV2Router01} from "contracts/interfaces/IUniswapV2Router01.sol";


contract ArrorUniFactoryTest is Test {
    ArrorUniFactory arrorUniFactory;
    IUniswapV2Router01 public UNISWAP_V2_ROUTER_MAINNET = IUniswapV2Router01(0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D);
    IUniswapV2Factory public UNISWAP_V2_FACTORY_MAINNET = IUniswapV2Factory(0x5C69bEe701ef814a2B6a3EDD4B1652CB9cc5aA6f);
    address public constant WETH9 = address(0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2);

    function setUp() public {
        vm.createSelectFork(vm.envString("MAINNET_RPC_URL"));
        arrorUniFactory = new ArrorUniFactory(address(UNISWAP_V2_ROUTER_MAINNET), address(UNISWAP_V2_FACTORY_MAINNET));
    }

    function testCreateERC404() public {
        (ArrorERC404 arrorERC404, address uniPair) = arrorUniFactory.createERC404("name", "symbol", 18, 100, "uri1", "uri2", "uri3", "uri4", "uri5", WETH9);
        console2.log("arrorERC404 address:", address(arrorERC404));
        console2.log("uniPair address:", uniPair);
    }

}