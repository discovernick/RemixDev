//SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
// The '@' symbol is the way Remix looks for a specific package, instead of a standard https
// This will not work across all IDE's
contract tokenEasy is ERC20("WhiteBoardCrypto","WBC"){

    address public creator;

    constructor() {
        creator = msg.sender;
    }

    modifier onlyOwner{
        require(msg.sender == creator);
        _;
    }

    function mintToken(uint amount) public onlyOwner{
        _mint(msg.sender, amount);
    }

}