pragma solidity ^0.7.0;

// A contract in the sense of Solidity is a collection of code (its functions)
// and data (its state) that resides at a specific address on the Ethereum
// blockchain.

contract SimpleStorage {

    // All identifiers (contract names, function names and variable names) are
    // restricted to the ASCII character set.

    // state varaible of type uint (unsigned integer of 256 bits)
    uint storedData;

    function set(uint x) public {
        storedData = x;
    }

    function get() public view returns (uint) {
        return storedData;
    }
}