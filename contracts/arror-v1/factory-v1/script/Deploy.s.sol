// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

import {Script, console2} from "forge-std/Script.sol";
import "../src/ArrorFactory.sol";

contract DeployScript is Script {
    
    ArrorFactory public immutable factory;
    address public dysonRouter;
    address public dysonFactory;


    function setUp() public {
        dysonRouter = vm.envAddress("DYSON_ROUTER");
        dysonFactory = vm.envAddress("DYSON_FACTORY");
    }

    function run() public {
        vm.startBroadcast(vm.envUint("DEV_PRIVATE_KEY"));

        factory = new ArrorFactory(dysonRouter, dysonFactory);

        vm.stopBroadcast();
        console2.log("factory = ", address(factory));
    }
}
