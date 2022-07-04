// SPDX-License-Identifier: MIT

pragma solidity ^0.5.0;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/Adoption.sol";

contract TestAdoption {
    // The address of the adoption contract to be tested
    Adoption adoption = Adoption(DeployedAddresses.Adoption());

    // The id of the pet that will be used for testing
    uint256 expectedPetId = 8;

    // The expected owner of adopted pet is this contract
    address expectedAdopter = address(this);

    // Testing the adopt() function
    function testUserCanAdoptPet() public {
        uint256 returnedId = adoption.adopt(expectedPetId);

        Assert.equal(
            returnedId,
            expectedPetId,
            "Adoption of the expected pet should match what is returned."
        );
    }

    // Testing retrieval of a single pet's owner
    function testGetAdopterAddressByPetId() public {
        // since adopters is a public variable, it has a default get method
        address adopter = adoption.adopters(expectedPetId);

        Assert.equal(
            adopter,
            expectedAdopter,
            "Owner of the expected pet should be this contract"
        );
    }

    // Testing retrieval of all pet owners
    function testGetAdopterAddressByPetIdInArray() public {
        // Store adopters in memory rather than contract's storage
        // The memory attribute tells Solidity to temporarily store the value in memory, rather than saving it to the contract's storage.
        address[16] memory adopters = adoption.getAdopters();

        // Since adopters is an array, and we know from the first adoption test that we adopted pet expectedPetId, we compare the testing contracts address with location expectedPetId in the array.
        Assert.equal(adopters[expectedPetId], expectedAdopter, "Owner of the expected pet should be this contract");
    }
}