// SPDX-License-Identifier: MIT

pragma solidity >=0.6.0 <0.9.0;

contract Verify {
    struct Customer {
        string name;
        string pictureURL;
    }

    address public owner;
    mapping(string => Customer) private hashToCustomer;

    constructor() {
        owner = msg.sender;
    }

    function addCustomer(
        string memory _qr_hash,
        string memory _name,
        string memory _pictureURL
    ) public onlyOwner {
        hashToCustomer[_qr_hash] = Customer({
            name: _name,
            pictureURL: _pictureURL
        });
    }

    function getCustomer(string memory _qr_hash)
        public
        view
        returns (string memory, string memory)
    {
        Customer memory curr_customer = hashToCustomer[_qr_hash];
        return (curr_customer.name, curr_customer.pictureURL);
    }

    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }
}
