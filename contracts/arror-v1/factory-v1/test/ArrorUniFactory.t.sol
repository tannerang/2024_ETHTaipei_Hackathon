// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.21;

import {Test, console2} from "forge-std/Test.sol";
import {ArrorUniFactory} from "../src/ArrorUniFactory.sol";
import {ERC404A} from "../src/ERC404-A.sol";
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

    ERC404A erc404a;
    address uniswapV2Pair;

    address public user = makeAddr("User");
    address public maker = makeAddr("Maker");
    address public trader = makeAddr("Trader");

    
    function setUp() public {
        vm.createSelectFork(vm.envString("SEPOLIA_RPC_URL"));
        arrorUniFactory = new ArrorUniFactory(address(UNISWAP_V2_ROUTER_SEPOLIA), address(UNISWAP_V2_FACTORY_SEPOLIA));

        deal(user, 10000 ether);

        vm.startPrank(user);
        (erc404a, uniswapV2Pair) = arrorUniFactory.createERC404{value: 0.1 ether}("name", "symbol", 18, 10000, "uri1", "uri2", "uri3", "uri4", "uri5", address(WETH9_SEPOLIA), 10 ** 22);
        vm.stopPrank();
        console2.log("erc404a address:", address(erc404a));
        console2.log("uniswapV2Pair address:", uniswapV2Pair);
    }

    
    function testCreateERC404() public {
        vm.startPrank(user);
        (erc404a, uniswapV2Pair) = arrorUniFactory.createERC404{value: 0.1 ether}("memecoin", "symbol", 18, 10000, "uri1", "uri2", "uri3", "uri4", "uri5", address(WETH9_SEPOLIA), 10 ** 22);
        require(keccak256(bytes(erc404a.name())) == keccak256(bytes("memecoin")), "name assert failed");
        vm.stopPrank();
    }

    function testPairGetReserves() public {
        vm.startPrank(user);
        (uint112 reserve0, uint112 reserve1, )= IUniswapV2Pair(uniswapV2Pair).getReserves();
        require(reserve0 == 1e22, "reserve0 assert failed");
        require(reserve1 == 1e17, "reserve1 assert failed");
        vm.stopPrank();
    }

    function testPairSwap() public {
        deal(trader, 0.01 ether);
        
        vm.startPrank(trader);

        // Approve WETH to UNISWAP_V2_ROUTER
        IERC20(address(WETH9_SEPOLIA)).approve(address(UNISWAP_V2_ROUTER_SEPOLIA), type(uint).max);

        // Define address path
        address[] memory path = new address[](2);
        path[0] = address(WETH9_SEPOLIA);
        path[1] = address(erc404a);

        // Execute swap
        UNISWAP_V2_ROUTER_SEPOLIA.swapExactETHForTokens{value: 0.01 ether}(
            0, 
            path, 
            trader, 
            (block.timestamp+9999)
        );
        vm.stopPrank();
        console2.log(erc404a.erc20BalanceOf(trader)); // 906610893880149131581
    }
}