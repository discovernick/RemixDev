//SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

// Part 1 - Set up a contract with the signMe function that is already setup - Need to use Interface

interface signatureInterface{
    function signMe(address userAddress, string memory signature) external returns(string memory);
}

contract Sign{

    function signContract() public payable returns(bool){
        signatureInterface contract_ = signatureInterface(0x3CdBff65DaC67cDb6E5c4F05c4DB8FE05C20e4D8);
        contract_.signMe(msg.sender, "Signed!!!");
        return true;
    }    
    
}

// Part 2 - Create Token with your name and give 5 tokens to the contract above

// Reference Docs: https://docs.openzeppelin.com/contracts/4.x/erc20

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract niksToken is ERC20("Nikolay", "NIK"){
    function sendFiveTokens() public{
        address contract_ = 0x3CdBff65DaC67cDb6E5c4F05c4DB8FE05C20e4D8;
        _mint(contract_,5);
    }
}