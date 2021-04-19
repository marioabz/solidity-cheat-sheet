
pragma solidity ^0.8.0;

// When upgrading a smart contract, e.g. eith the help of the 'Proxy
// Delegate' pattern, what really happens is that a new version of
// the contract is deployed to the network and coexists with the old
// version. Because the old contract is not actually updated to a
// a new version, the accumulated storage still resides at the old
// address
contract EternalStorage {


}
