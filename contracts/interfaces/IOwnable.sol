// SPDX-License-Identifier: AGPL-3.0
pragma solidity ^0.8.0; 

interface IOwnable {
    function owner() external view returns (address);

    function renounceManagement() external;

    function transferOwnership(address newOwner_) external;
 
}
