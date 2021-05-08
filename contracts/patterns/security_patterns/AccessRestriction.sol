pragma solidity ^0.4.0;


// Restrict the access to contract functionality according to
// suitable criteria.
// Access restriction is achieved by declaring your state variables as
// private. Also functions can be declared 'private', however doing so
// would prevent everyone outside the contract scope from calling it 
// under any circumstances. Simply declaring them 'public', however,
// would open up access to every participant in the network. Most of
// the times it is desired to allow access to functionality in case
// certain rules are met.
// Often the access is supposed to be restricted to a defined set of
// entities, like the administrators of a contract.

// Use the Access Restriction pattern when:
// - contract functions should only be callable under certain
// circumstances,
// - one wants to apply similar restrictions to several functions,
// - one wants to increase security of his smart contract against
// unauthorized access

contract AccessRestriction {

}
