pragma solidity ^0.8.0;


contract TightlyPackedData {

// The 'Thight variable packing' pattern optimizes gas consumption
// when storing or loading statically-sized variables.

// This pattern should be used when one:
// - wants to reduce contract interactions costs,
// - is using more than one statically-sized state variable and can
// afford to use variables of smaller sizes,
// - is using a struct consisting of more than one variable and can
// - afford to use variables of smaller sizes,
// - is using a statically-sized array and can afford to use a
// variable of a smaller size.

    struct TightlyPackedStruct {
        uint8 a;
        uint8 b;
        uint8 c;
        uint8 d;
        bytes1 e;
        bytes1 f;
        bytes1 g;
        bytes1 h;
    }

    TightlyPackedStruct MyTPS;

    function createTPS() public {
        TightlyPackedStruct memory 
        _myStruct = TightlyPackedStruct(1,2,3,4,"a","b","c","d");
        MyTPS = _myStruct;
    }
}