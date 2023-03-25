// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.0; 

import "./interfaces/IOwnable.sol";

abstract contract Ownable is IOwnable {
    address internal _owner;
    address internal _newOwner;

    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner); 

    constructor() {
        _owner = msg.sender;
        emit OwnershipTransferred(address(0), _owner);
    }

    function owner() public view override returns (address) {
        return _owner;
    }

    modifier onlyOwner() {
        require(_owner == msg.sender, "Ownable: caller is not the owner");
        _;
    }

    function renounceManagement() public virtual override onlyOwner {
        emit OwnershipTransferred(_owner, address(0));
        _owner = address(0);
        _newOwner = address(0);
    }

    function transferOwnership(address newOwner_) public virtual override onlyOwner {
        emit OwnershipTransferred(_owner, newOwner_);
        _owner = newOwner_;
    }
 
}
