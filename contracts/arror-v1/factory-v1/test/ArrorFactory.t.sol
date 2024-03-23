// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

import {Test, console2} from "forge-std/Test.sol";
import {ArrorFactory} from "../src/ArrorFactory.sol";
import {ArrorERC404} from "../src/ArrorERC404.sol";

contract CounterTest is Test {
    ArrorFactory factory;
    
    function setUp() public {
        // factory = new ArrorFactory();
    }

    function testCreateERC404() public {
        // ArrorERC404 new404 = factory.createERC404("name", "symbol", 18, 100, "uri1", "uri2", "uri3", "uri4", "uri5");
    }

}