//SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;


// Amounts we can send:
// - wei is very small amount
// - gwei 1 billion wei - 10^9 wei
// - Ether is 1 billion x 1 billion wei = 1 billion gwei - 10^18 wei

contract vault{
    address payable creator;

    constructor() payable {
        creator = payable(msg.sender);
    }

    modifier onlyOwner(){
      require(msg.sender == creator, "You're not the owner");
      _;
    }

    // By putting the payable feature on the constructor, we can actually draw in the amount into the contract
    // vault without needing run the depositSomeMoney function 

    receive() external payable{} //Basic Building Block, cannot send any ether otherwise

    function depositSomeMoney() public payable returns(uint){
        return msg.value; // gives how much is being sent in the transaction
    }

    function getBalance() public view returns(uint){
        return address(this).balance;
    }

    function takeOutWithTransfer(uint amount) public onlyOwner{
        address payable mine = payable(msg.sender);
        mine.transfer(amount * (10**18));
    }

    function takeOutWitSend(uint amount) public onlyOwner returns(bool){
        address payable mine = payable(msg.sender);
        bool tryToSend = mine.send(amount*(10**18));
        return tryToSend;
    }

    function takeOutWithCall(uint amount) public onlyOwner returns(bool, bytes memory){
        address payable mine = payable(msg.sender);
        (bool tryToSend, bytes memory data) = mine.call{value: amount, gas: 5000}(""); // We can contro amount of ether and gas
        return (tryToSend, data);    
    }
}

// When you deploy the contract the value becomes zero
// In this way you dont send the transaction twice
// cant have something be view and payable
// Value units are in wei!!

// Unlike Transfer, send actually returns a value dictating
// whether the transaction was successful or not.
// When transferring more than you had in your account, transfer will throw an error and revert back returning all used GAS
// When doing the same but with send, the difference is that it wont through an error, but the resultant BOOL value will be false
// Bpth Transfer and send, send an allocation of 2300 gas, if were performing anything complicated, the transaction will fail.

