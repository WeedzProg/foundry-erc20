//SPDX-License-Identifier:MIT

pragma solidity ^0.8.18;

import {Script} from "forge-std/Script.sol";
import {OurToken} from "../src/OurToken.sol";
import {DeployOurToken} from "../script/DeployOurToken.s.sol";
import {Test, console} from "forge-std/Test.sol";
import {StdCheats} from "forge-std/StdCheats.sol";

contract OurTokenTest is StdCheats, Test {
    OurToken public ourToken;

    address public bob = makeAddr("bob");
    address public alice = makeAddr("alice");
    uint256 public constant STARTING_USER_BALANCE = 10 ether;

    function setUp() external {
        DeployOurToken deployer = new DeployOurToken();
        (ourToken) = deployer.run();
        // vm.deal(bob, STARTING_USER_BALANCE);
        // vm.deal(alice, STARTING_USER_BALANCE);

        vm.prank(msg.sender);
        ourToken.transfer(bob, STARTING_USER_BALANCE);
    }

    function testDecimals() public view {
        assert(ourToken.decimals() == 18);
    }

    function testAllowances() public {
        uint256 maxAllowance = 5;

        vm.prank(bob);
        ourToken.approve(alice, maxAllowance);

        vm.prank(alice);
        ourToken.transferFrom(bob, alice, maxAllowance);

        assert(ourToken.balanceOf(bob) == STARTING_USER_BALANCE - maxAllowance);
    }
}
