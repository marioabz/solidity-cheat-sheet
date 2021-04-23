
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

// It would be possible to implement this pattern with a rigid
// representation of the needed storage, by implementing only the 
// currently used data types in the eternal storage. To avoid upgrades
// to the data store, however, it should be designed as flexible  as
// possible. 
// This flexibility is achieved by implementing several mappings, one
// for each data type, in which data can be stored. These mappings map
// the abstracted down value to a certain sha3 hash acting as a
// key-value storage.

// A sha3 hash is used as the key , in order to allow identifiers of
// arbitrary length to be used as keys. Using hashed as keys also enables
// the storage of complicated data types, like mappings (using
// keccak256('balances', 'UserID123') as the key for storing the balance
// of the user with the ID 123).

// Each mapping should be equipped with three functions to manage storage
// retrieval and deletion. The storage function stores a provided value
// and the associated key in the respective mapping, depending on the
// data type of the value.
// Because the functions for storage and deletion are affecting the
// contract state, they should be guarded by the Access Restriction
// pattern, so access is only allowed from the most recent version of the
// contract using the eternal storage. The address of the current version
// can be stored in a variable and should only be changeable by authorized
// addresses.

    address owner = msg.sender;
    address latestVersion;

    mapping(bytes32 => uint) uIntStorage;
    mapping(bytes32 => address) addressStorage;

    modifier onlyLatestVersion() {
        require(msg.sender == latestVersion);
        _;
    }

    function upgradeVersion(address _newVersion) public{
        require(msg.sender == owner);
        latestVersion = _newVersion;
    }

    // ***** Getter methods *****
    function getUint32(bytes32 _key) external view returns(uint) {
        return uIntStorage[_key];
    }
}
