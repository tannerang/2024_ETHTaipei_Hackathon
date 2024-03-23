// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {Script, console2} from "forge-std/Script.sol";
import "../src/ArrorFactory.sol";

contract DeployScript is Script {
    
    ArrorFactory public immutable factory;

    function setUp() public {}

    function run() public {
        vm.startBroadcast(vm.envUint("DEV_PRIVATE_KEY"));

        // factory = new ArrorFactory(address(dysonRouter), address(dysonFactory));

        vm.stopBroadcast();
        // console2.log("factory = ", address(factory));
    }
}
