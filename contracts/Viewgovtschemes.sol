// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;
contract ViewGovtSchemes{
    struct Scheme {
        string name;
        uint256 Amt;
    }
    constructor() {
        addSchemeRecord("Health centre", 200000);
        addSchemeRecord("Road", 500000);
        addSchemeRecord("LIFE", 5000000);
    }
    mapping(address => Scheme[]) private schemeRecords;
    function addSchemeRecord(string memory _name, uint256 _Amt)public {
        Scheme memory schemes = Scheme(_name, _Amt);
        schemeRecords[msg.sender].push(schemes);
    }
     function ViewSchemes(address _account, uint256 _index) public view returns (string memory, uint256) {
        require(_index < schemeRecords[_account].length, "Invalid  index");
        Scheme memory sch = schemeRecords[_account][_index];
        return (sch.name,sch.Amt);
    }

}