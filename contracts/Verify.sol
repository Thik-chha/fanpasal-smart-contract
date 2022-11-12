// SPDX-License-Identifier: MIT

pragma solidity >=0.6.0 <0.8.0;

contract Verify {
    struct Customer {
        string name;
        string pictureURL;
    }

    address public owner;
    mapping(string => Customer) private hashToCustomer;

    constructor() public {
        owner = msg.sender;
    }

    function addCustomer(
        string _qr_hash,
        string _name,
        string _pictureURL
    ) public onlyOwner {
        hashToCustomer[_qr_hash] = Customer({
            name: _name,
            pictureURL: _pictureURL
        });
    }

    function getCustomer(string _qr_hash) public view returns (Customer) {
        return hashToCustomer[_qr_hash];
    }

    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }
}
