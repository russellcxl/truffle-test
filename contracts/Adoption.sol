// SPDX-License-Identifier: MIT

pragma solidity >=0.4.20;

contract Adoption {
    // arr of addresses with size 16
    address[16] public adopters;

    // Adopting a pet
    // using idx as petId
    function adopt(uint256 petId) public returns (uint256) {
        require(petId >= 0 && petId <= 15);

        // set the sender's address
        adopters[petId] = msg.sender;

        return petId;
    }

    // Retrieving the adopters
    // memory type is like a pointer
    function getAdopters() public view returns (address[16] memory) {
        return adopters;
    }
}
