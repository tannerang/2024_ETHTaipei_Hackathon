// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.21;

import {Test, console2} from "forge-std/Test.sol";
import {ArrorUniFactory} from "../src/ArrorUniFactory.sol";
import {ArrorERC404} from "../src/ArrorERC404.sol";
import {IUniswapV2Factory} from "contracts/interfaces/IUniswapV2Factory.sol";
import {IUniswapV2Router01} from "contracts/interfaces/IUniswapV2Router01.sol";
import {IUniswapV2Router02} from "contracts/interfaces/IUniswapV2Router02.sol";
import {IUniswapV2Pair} from "contracts/interfaces/IUniswapV2Pair.sol";
import {IWETH} from "contracts/interfaces/IWETH.sol";
import {IERC20} from "contracts/interfaces/IERC20.sol";


contract ArrorUniFactoryTest is Test {
    ArrorUniFactory arrorUniFactory;
    IUniswapV2Router01 public UNISWAP_V2_ROUTER_MAINNET = IUniswapV2Router01(0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D);
    IUniswapV2Factory public UNISWAP_V2_FACTORY_MAINNET = IUniswapV2Factory(0x5C69bEe701ef814a2B6a3EDD4B1652CB9cc5aA6f);
    address public constant WETH9 = address(0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2);

    IUniswapV2Router02 public UNISWAP_V2_ROUTER_SEPOLIA = IUniswapV2Router02(0xC532a74256D3Db42D0Bf7a0400fEFDbad7694008);
    IUniswapV2Factory public UNISWAP_V2_FACTORY_SEPOLIA = IUniswapV2Factory(0x7E0987E5b3a30e3f2828572Bb659A548460a3003);
    IWETH public WETH9_SEPOLIA = IWETH(0x7b79995e5f793A07Bc00c21412e50Ecae098E7f9);

    ArrorERC404 arrorERC404;
    address uniswapV2Pair;

    address public user = makeAddr("User");

    
    function setUp() public {
        // vm.createSelectFork(vm.envString("MAINNET_RPC_URL"));
        // arrorUniFactory = new ArrorUniFactory(address(UNISWAP_V2_ROUTER_MAINNET), address(UNISWAP_V2_FACTORY_MAINNET));

        vm.createSelectFork(vm.envString("SEPOLIA_RPC_URL"));
        arrorUniFactory = new ArrorUniFactory(address(UNISWAP_V2_ROUTER_SEPOLIA), address(UNISWAP_V2_FACTORY_SEPOLIA));
        
        /*
        (arrorERC404, uniswapV2Pair) = arrorUniFactory.createERC404("name", "symbol", 18, 10000, "uri1", "uri2", "uri3", "uri4", "uri5", address(WETH9_SEPOLIA));
        console2.log("arrorERC404 address:", address(arrorERC404));
        console2.log("uniswapV2Pair address:", uniswapV2Pair);
        */

        deal(user, 10000 ether);
        //deal(address(arrorERC404), user, 10000 * 10 ** arrorERC404.decimals());
    }

    
    function testCreateERC404() public {
        // (ArrorERC404 arrorERC404, address uniswapV2Pair) = arrorUniFactory.createERC404("name", "symbol", 18, 100, "uri1", "uri2", "uri3", "uri4", "uri5", WETH9);

        (arrorERC404, uniswapV2Pair) = arrorUniFactory.createERC404{value: 1 ether}("name", "symbol", 18, 10000, "uri1", "uri2", "uri3", "uri4", "uri5", address(WETH9_SEPOLIA), 10 ** 19);
        console2.log("arrorERC404 address:", address(arrorERC404));
        console2.log("uniswapV2Pair address:", uniswapV2Pair);
    }
    

    function testPairAddLiquidity() public {
        /*
        vm.startPrank(user);
        arrorERC404.erc20Approve(address(UNISWAP_V2_ROUTER_SEPOLIA), 10000 * 10 ** arrorERC404.decimals());
        UNISWAP_V2_ROUTER_SEPOLIA.addLiquidity{value:10 ether}(
            address(arrorERC404),
            10 * 10 ** arrorERC404.decimals(),
            0,
            0,
            user,
            (block.timestamp+9999)
        );
        vm.stopPrank();

        IUniswapV2Pair wethArrorPair = IUniswapV2Pair(UNISWAP_V2_FACTORY_SEPOLIA.getPair(address(WETH9_SEPOLIA), address(arrorERC404)));
        (uint112 _reserve0, uint112 _reserve1,) = wethArrorPair.getReserves();
        console2.log(_reserve0);
        console2.log(_reserve1);

        // assertEq(_reserve0, 0);
        // assertEq(_reserve1, 0);

        */
    }

}