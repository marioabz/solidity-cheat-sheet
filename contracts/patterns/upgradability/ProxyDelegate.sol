pragma solidity ^0.8.0;

// Introduce the possibility to upgrade smart contracts without breaking 
// any dependencies.
// Mutability in Ethereum is hard to achieve, but necessary
// To overcome the limitations introduced by the inmutability of contract
// code, a contract can be split up into modules, which are then virtually
// upgradeable.

// They are only virtually upgradeable, because existing contracts still
// cannot be changed. However, a new version of the contract can be
// deployed and its adress replaces the old one in storage. To avoid 
// breaking dependencies of other contracts that are referencing the
// upgraded contract, or users who do not know about the release of a new
// contract version (that comes with a new address), we make use of a proxy
// (sometimes also called dispatcher) contract that delegates call to the
// specific modules.
contract ProxyDelegate {

// Use the Proxy Delegate patten when one:
// - wants to delegate function calls to other contracts,
// - you need upgradeable delegates, without breaking dependencies,
// - you are familiar with advanced concepts like delegatecalls and inline
// assembly.
// The basic idea is that a caller (external or contract address) makes
// a function call to the proxy, which delegates the call to the delegate,
// where the function code is located. The result is then returned to the
// proxy, which forwards it to the caller. To know at which address the
// current version of the delegate resides, the proxy can either store it
// itself in a variable, or in case the 'Ethernal Storage' pattern is used,
// consult the external storage for the current address.

// Implementation
// A delegate call is used to execute functions at a delegate in the context
// of the proxy and without having to know the function identifiers, because
// 'delegatecall' forwards the msg.data, containing the function identifier
// in the first 4 bytes.

}
