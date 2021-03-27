pragma solidity ^7.0.0;

// A contract in the sense of Solidity is a collection of code (its functions)
// and data (its state) that resides at a specific address on the Ethereum
// blockchain.

contract Types {

    // state variables are variables whose values are permanently 
    // stored in contract storage.

    // THe concept of 'undefined' or 'null' values does not exist in
    // Solidity, but newly declared variables always have a default
    // value dependent on its type.

    // The operators '||' and '&&' apply the common short-circuiting
    // rules.
    bool public available;,
    bool public isMarketClosed;
    bytes public gates;

    // uint and int are aliases for uint256 and int256, respectively.
    // For an integer tpye 'x', you can use tpye(X).min and type(X).max
    // to access minimum and maximum value representable by the type.
    uint public hardCap;


    constructor(
        bool _availability,
        uint _hardCap,
    ) {
        hardCap = _hardCap;
        available = _availability;
        isMarketClosed = !_availability;
        gates = 1;
    }
}