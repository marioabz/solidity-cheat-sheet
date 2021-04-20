
pragma solidity ^0.8.0;

// When upgrading a smart contract, e.g. eith the help of the 'Proxy
// Delegate' pattern, what really happens is that a new version of
// the contract is deployed to the network and coexists with the old
// version. Because the old contract is not actually updated to a
// a new version, the accumulated storage still resides at the old
// address.
// The solution consists of separatings the storage from the contract
// logic. A separate contract with the sole purpose of acting as a
// storage to another contract.
// The storage is supposed to last over the whole  lifetime of the
// initial contract, therefore the name eternal storage.
contract EternalStorage {

// Use the Eternal Storage pattern when:
// - your contract is upgreadable and should retain storage after
// an upgrade,
// - you want to avoid problems migrating storage after a contract
// upgrade,
// - you can accept a slightly more complex syntax for storing data

}
