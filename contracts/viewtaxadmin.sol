// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract viewtaxadmin {
    struct Tax {
        string username;
        string taxType;
        uint256 pendingAmount;
        string deadline;
        bool status;
    }

    mapping(address => Tax[]) private taxRecords;

    function addTaxRecord(
        string memory _username,
        string memory _taxType,
        uint256 _pendingAmount,
        string memory _deadline,
        bool _status
    ) public  {
        Tax memory newTax = Tax(_username, _taxType, _pendingAmount, _deadline, _status);
        taxRecords[msg.sender].push(newTax);
    }

    function No_of_records(address _account) public view returns (uint256) {
        return taxRecords[_account].length;
    }

    function ViewTaxRecord(address _account, uint256 _index)
        public
        view
        returns (string memory, string memory, uint256, bool)
    {
        require(_index < taxRecords[_account].length, "Invalid tax record index");
        Tax memory tax = taxRecords[_account][_index];
        return (tax.username, tax.taxType, tax.pendingAmount, tax.status);
    }

    
}
