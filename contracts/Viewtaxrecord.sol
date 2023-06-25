// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;



contract ViewTaxRecord {
    struct Tax {
        string taxType;
        uint256 pendingAmount;
        string deadline;
        bool status;
    }
    constructor() {
    addTaxRecord("Income Tax", 5000,  '05-07-2023',false);
    addTaxRecord("Property Tax", 1000,  '15-07-2023',false);
    addTaxRecord("Sales Tax", 1500, '',true);
    }
    
    mapping(address => Tax[]) private taxRecords;
    
    function addTaxRecord(string memory _taxType, uint256 _pendingAmount, string memory _deadline,bool _status)private {
        Tax memory newTax = Tax(_taxType, _pendingAmount, _deadline,_status);
        taxRecords[msg.sender].push(newTax);
    }
    
    
    
    function No_of_records(address _account) public view returns (uint256) {
        return taxRecords[_account].length;
    }
    
    function ViewAll(address _account, uint256 _index) public view returns (string memory, uint256,bool) {
        require(_index < taxRecords[_account].length, "Invalid tax record index");
        Tax memory tax = taxRecords[_account][_index];
        return (tax.taxType, tax.pendingAmount,tax.status);
    }
   function PendingOnly(address _account, uint256 _index) public view returns (string memory, uint256, string memory) {
    require(_index < taxRecords[_account].length, "Invalid tax record index");
    Tax memory tax = taxRecords[_account][_index];
    require(!tax.status, "Pending only");
    return (tax.taxType, tax.pendingAmount, tax.deadline);
}
    
    
}
