pragma solidity ^0.4.21;


contract Coin {

    // address type holds 20 bytes values (size of Ethereum addresses)
    address public minter;

    // mapping data type allows to create relationships between a 
    // key and a value.
    // 'mapping' works like a hash table.
    mapping (address => uint) public balances;

    // Events are convenience interfaces with the EVM logging facilities.
    event Sent(address from, address to, uint amount);

    function Coin() public {
        minter = msg.sender;
    }

    function mint(address receiver, uint amount) public {
        if (msg.sender != minter) return;
        balances[receiver] += amount;
    }

    function send(address receiver, uint amount) public {
        if (balances[msg.sender] < amount) return;
        balances[msg.sender] -= amount;
        balances[receiver] += amount;
        emit Sent(msg.sender, receiver, amount)
    }
}
