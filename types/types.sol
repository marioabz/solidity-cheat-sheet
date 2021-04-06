pragma solidity ^7.0.0;

// A contract in the sense of Solidity is a collection of code (its functions)
// and data (its state) that resides at a specific address on the Ethereum
// blockchain.

// Every contract defines its own type. You can implicitly convert contracts
// they inherit from.
// Contracts don't support any operators.

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

    // There are 2 types of representation of bytes: fixed-size and 
    // dynamically-sized.
    // Strings and bytes are stored as big endian.
    // Other types (numbers, addresses, etc.) are stored as little endian.
    // Use 'bytes' instead of 'bytes[]', it saves 31 bytes of space.
    bytes public gates;

    // The address types comes in 2 flavors: address, and address payable.
    // 'address payable' has 'transfer' and 'send' as aditional members.

    // Explicit conversions to and from address are allowed for uint180,
    // integer literals, bytes20 and contract types.

    // Only expressions of type 'address' and contract-type can be converted
    // to the type 'address payable' via the explicit conversion 'payable(...)'.
    address public owner;

    // One can have a bytes[], bytes, bytes<N> (1 <= N <= 32).
    // Fixed-sized byte arrays are always prefered since they are cheaper and //
    // they can be passed as arguments to other contracts.
    bytes4 public words;
   
    // Implicit conversions from 'address payable' to 'address' are allowed,
    // whereas conversions from 'address' to 'address payable' must be
    // explicit via 'payable(<address>)'
    address payable public backupOwner;

    // uint and int are aliases for uint256 and int256, respectively.
    // For an integer tpye 'x', you can use tpye(X).min and type(X).max
    // to access minimum and maximum value representable by the type.
    uint public hardCap;


    constructor( 
        bool _availability,
        uint _hardCap,
        address owner
    ) {
        hardCap = _hardCap;
        available = _availability;
        isMarketClosed =  ~_availability;
        gates = 1;
        owner = msg.sender;
    }

    // Modifiers change the way functions work.


    // There are four types of Solidity functions: external, internal,
    // public and private.
    // Functions can be set as 'view' and 'pure' to restrict reading and
    // modifying of the state.

}