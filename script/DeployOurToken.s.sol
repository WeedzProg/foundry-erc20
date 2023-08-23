//SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Script, console} from "forge-std/Script.sol";
import {OurToken} from "../src/OurToken.sol";

contract DeployOurToken is Script {
    uint256 public constant INITIAL_SUPPLY = 1_000_000 ether; // 1 million tokens with 18 decimal places
uint256 public deployerKey;
    function run() external returns (OurToken){
        if (block.chainid == 31337) {
            console.log("Running on Anvil");
            //deployerKey = vm.envUint(PRIVATE_KEY_ANVIL);
        } else {
            console.log("Running on Ethereum");
            //deployerKey = vm.envUint(PRIVATE_KEY_TESTNET);
        }
        vm.startBroadcast();
        OurToken ourToken = new OurToken(1000000000000000000000000);

        vm.stopBroadcast();
        return ourToken;
    }
}
