//SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract homework1 {

    // 1) Create a function that adds 60 and 40

    function add2nums() public pure returns(int){
        return (60+40);
    }

    // 2) Create a function that returns your name

    function name() public pure returns(string memory) {
        return "Nikolay";
    }

    // 3) Create a function where inputting "cookie" returns "yum", otherwise it says "yuck"

    function monster(string memory argv) public pure returns(string memory) {
        if (keccak256(bytes(argv)) == keccak256(bytes("cookie"))) {
            return "yum";
        } else {
            return "yuck";
        }

    }

    // 4) Create a function that takes 2 numbers, adds them, and if the result is 10, it returns "party"

    function party(int x, int y) public pure returns(string memory) {
        if ((x+y) == 10) {
            return "party";
        } else {
            return "";
        }
    }

    // 5) Create a function that doubles 1 x times, where you give it x. Don't use exponents.

    function doubles(uint x) public pure returns(uint) {
        uint total = 1;
        for (uint i = 0; i < x; i++ ) {
            total = total * 2;
        }
        return total;
    }




}