pragma solidity ^0.8.0;


// By using this pattern we are making use og the view function modifier
// in Solidity, which allows us to aggregateand read data from contract 
// storage without any associated costs. Everytime a lookup is requested,
// an array is rebuilt in memory, instead opf saving it to storage.

// Use the Memory Array Building pattern when:
// - you want to retrieve aggregated data from storage,
// - you want to avoid paying gas when retrieving data,
// - your data has attributes that are subject to changes.

// To achieve a completely free request, the request has to be made 
// externally meaning not from another contract inside the network, as this
// would lead to the need for a gas intensive transaction.

contract MemoryArrayBuilding {

    struct Item {
        string name;
        string category;
        address owner;
        uint32 zipcode;
        uint32 price;
    }

    Item[] public items;
}
