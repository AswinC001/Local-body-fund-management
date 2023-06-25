pragma solidity ^0.8.0;

contract LocalBodyFinance {
    struct Fine {
        string fineType;
        uint256 amount;
        bool paid;
    }

    address public manager;
    mapping(address => Fine) public fines;

    event FineAdded(address indexed person, string fineType, uint256 amount);
    event FinePaid(address indexed person, string fineType, uint256 amount);

    modifier onlyManager() {
        require(msg.sender == manager, "Only the manager can perform this operation");
        _;
    }

    constructor() {
        manager = msg.sender;
    }

    function addFine(address _person, string memory _fineType, uint256 _amount) public onlyManager {
        require(_person != address(0), "Invalid address");
        require(bytes(_fineType).length > 0, "Fine type must be specified");
        require(_amount > 0, "Amount must be greater than zero");

        fines[_person] = Fine(_fineType, _amount, false);
        emit FineAdded(_person, _fineType, _amount);
    }

    function payFine(uint256 _inputAmount) public payable {
        Fine storage fine = fines[msg.sender];
        require(fine.amount > 0, "No fine to pay");
        require(!fine.paid, "Fine already paid");
        require(_inputAmount == fine.amount, "Incorrect amount entered");

        fine.paid = true;
        emit FinePaid(msg.sender, fine.fineType, fine.amount);
    }
}
