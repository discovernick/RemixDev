//SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract tokenHard{

    address public creator;

    constructor() {
        creator = msg.sender;
    }

    modifier onlyOwner{
        require(msg.sender == creator);
        _;
    }

    mapping(address => uint) public balances;
    string public name = "WhiteBoardCrypto";
    string public symbol = "WBC";
    uint public totalSupply = 0;

    function getBalance(address whichToCheck) public view returns(uint){
        return balances[whichToCheck];
    }

    function addFive() public {
        balances[msg.sender] = balances[msg.sender] + 5;
        totalSupply += 5;
    }

    function transfer(address destination, uint value) public returns(bool){
        require(value <= balances[msg.sender], "You don't have enough tokens mate!!");
        require(destination != address(0));
        balances[msg.sender] -= value;
        balances[destination] += value;
        return true;
    }
    
}