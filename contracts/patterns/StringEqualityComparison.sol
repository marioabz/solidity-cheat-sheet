pragma solidity ^0.8.0;


// Check for the equality of two provided strings in a way that 
// minimizes average gas consumption for a large number of
// different inputs.
contract StringEqualityComparison {

    // Use the 'String Equality Comparison' pattern when:
    // - want to check two strings for equality,
    // - most of your strings to compare are longer than 2 characters,
    // - want to minimize the average amount of gas needed for a broad
    // variety of strings.

    function hashCompareWithLengthCheck(
        string memory a, 
        string memory b) 
        internal returns (bool) {
        if (bytes(a).length != bytes(b).length) {
            return false;
        }
        return keccak256(a) == keccak256(b);
    }
}
