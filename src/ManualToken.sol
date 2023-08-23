//SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

contract ManualToken {
    mapping(address => uint) private s_balances;

    function name() public pure returns (string memory) {
        return "Manual Token";
    }

    function totalSupply() public pure returns (uint256) {
        return 1000000000000000000000000;
    }

    function decimals() public pure returns (uint8) {
        return 18;
    }

    function balanceOf(address _owner) public view returns (uint256) {
        return s_balances[_owner];
    }

    function transfer(address transferTo, uint256 amount) public {
        uint256 previousBalances = balanceOf(msg.sender) + balanceOf(transferTo);
        s_balances[msg.sender] -= amount;
        s_balances[transferTo] += amount;
        require(balanceOf(msg.sender) + balanceOf(transferTo) == previousBalances);
    }
}
