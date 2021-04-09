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
    bool public available;
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
    address public DAIcontract = 0x6b175474e89094c44da98b954eedeac495271d0f;

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
    uint public totalSupply;
    uint internal lastTransactionTime;

    // When a contract is created, its constructor (a function declared with the
    // 'constructor' keyword) is executed once.
    // A constructor is optional. Only one constructor is allowed.
    // After the constructor has executed, the finalcode of the contract is
    // deployed to the blockchain.
    // Internally, constructor arguments are passed 'ABI encoded' after the code
    // of the contract itself.
    constructor( 
        bool _availability,
        uint _hardCap,
        uint _totalSupply,
        address owner
    ) {
        hardCap = _hardCap;
        available = _availability;
        isMarketClosed =  ~_availability;
        gates = 1;
        owner = msg.sender;
        totalSupply = _totalSupply;
        lastTransactionTime = block.timestamp;
    }

    // Modifiers change the way functions work.
    modifier onlyOwner {
        require(msg.sender == owner, "NEED OWNER");
        _;
    }

    // There are four types of visibilities for functions and state variables:
    // external, internal, public and private.
    
    // external: external functions are part of the contract interface, which
    // means they can be called from other contracts via transactions.
    
    // public: public functions are part of the contract interface and can be
    // either called internally or via messages.
    function mint(uint balance) external {
        uint _supply = totalSupply + balance;
        require(hardCap <= _supply_ && balance > 0, "TOTAL SUPPLY EXCEEDS HARDCAP");
        totalSupply = _supply;
    }

    function transferDAI(address to, uint amount) external returns(bool) {
        signature = bytes("transfer(address,uint)");
        bool success = DAIcontract.call(abi.encodeWithSignature(signature, to, amount));
        return success;
    }

    // Functions can be set as 'view' and 'pure' to restrict reading and
    // modifying of the state.
    // Functions set to 'view' do not change the state.
    // Functions set to 'pure' should not modify or read from the state.
    function getAmountLeftForHC() public view {
        return hardCap - totalSupply;
    }

    function encodeHardCapTotalSupply() public view returns (bytes memory) {
        return abi.encode(hardCapp, totalSupply, owner);
    }

    function getMintFunctionSignature() public pure returns (bytes memory){
        return abi.encodeWithSignature("mint(uint)", 5);
    }

    // internal: Those functions and state variables can only be accessed
    // internally (from within the contract or contracts deriving from it),
    // without using 'this'.
    // private: private functions and state variables are only visible for the
    // contract they are defined in and not in derived contracts.

    function setTransactionTime() internal {
        lastTransactionTime = block.timestamp;
    }

    

    // Modification of the state include:
    // - creating other contracts,
    // - making solidity transfer Ether through calls,
    // - writing to state variables,
    // -removing events.

}