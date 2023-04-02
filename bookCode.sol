// SPDX-License-Identifier:UNLICENSED
pragma solidity ^0.8.0; // compiler version

// Declaring state variables
contract VariableStorage {
    uint storeUint; //uint256 storage variable
    //...
} // ends variableStorage contract

// Writing function definitions
contract AcceptEther {
    function deposit() public payable {
        //function example to accept ETH
        //...
    }
}

// Creating a custom modifier using function modifiers
contract AccountContract {
    address payable public owner;
    /*
     * Modifier onlyOwner definition.
     */
    modifier onlyOwner() {
        require(msg.sender == owner, "not owner");
        _; //Rest of the function body execution
    }

    /*
     * The deployer of the contract would become owner of contract
     */
    constructor() {
        owner = msg.sender;
    }

    /*
     * Modifier onlyOwner used, only allow owner to
     * call withdraw function
     */
    function withdraw() public onlyOwner {
        owner.transfer(address(this).balance);
    }
    //...
} // accountContract

// Using events for logging and callback
contract AcceptEtherWithLog {
    /*
     * Event declaration
     * @param _who Address of the account who deposited ETH.
     * Parameter indexed, to allow it to filter events on client side.
     * @param _amount Amount of Wei deposited to contract.
     */
    event Deposited(address indexed _who, uint256 _amount);

    function deposit() public payable {
        //function example to accept ETH
        //...
        //Emits the Deposited event in Logs of transaction data
        emit Deposited(msg.sender, msg.value);
    }
} // ends acceptEtherWithLog contract

// Custom data types with struct

contract LoanStruct {
    //Definition of struct
    struct LoanData {
        address borrower;
        address lender;
        uint256 loanAmount;
    }
} // ends loanStruct contract

// Custom types for constants with enum
contract LoanStructWithEnum {
    //Enum for LoanStatus
    enum LoanStatus {
        Pending,
        Created,
        Funded,
        Finished,
        Defaulted
    }
    //Definition of struct
    struct LoanData {
        address borrower;
        address lender;
        uint256 loanAmount;
        LoanStatus status; //LoanStatus stored.
    }
} // LoanStructWithEnum
// the example code shows the call and delegatecall usage:

contract CallExample { 
    address otherContract = 0xC4FE5518f0168DA7BbafE375Cd84d30f64CDa491;
    string param1 = "param1-string";
    uint param2 = 10;
    //With multiple parameters
    require(otherContract.call("methodName", param1, param2));
    require(otherContract.delegatecall("methodName", param1, param2));
    //With signatures
    require(otherContract.call(bytes4(keccak256("methodName(string, uint256)")), param1, param2));
    require(otherContract.delegatecall(bytes4(keccak256("methodName(string, uint256)")), param1, param2));
} // ends callExample contract

