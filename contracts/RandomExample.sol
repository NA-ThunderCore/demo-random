// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;
interface ThunderRandomLibraryInterface {
}


contract Example {
    address constant public randomNumberContractAddress = 0x8cC9C2e145d3AA946502964B1B69CE3cD066A9C7;
    ThunderRandomLibraryInterface internal RNGLibrary;

    constructor() {
    }

    function CallRand() external returns (uint256) {
    }
}

// interface ThunderRandomLibraryInterface {
//     function rand() external returns (uint256);
// }

// contract Example {
//     address constant public randomNumberContractAddress = 0x8cC9C2e145d3AA946502964B1B69CE3cD066A9C7;
//     ThunderRandomLibraryInterface internal RNGLibrary;

//     constructor() {
//         RNGLibrary = ThunderRandomLibraryInterface(randomNumberContractAddress);
//     }

//     function CallRand() external returns (uint256) {
//         uint256 randomNumber = RNGLibrary.rand();
//         return randomNumber;
//     }
// }




// contract Example {
//     event rand(uint256);
//     address constant public randomNumberContractAddress = 0x8cC9C2e145d3AA946502964B1B69CE3cD066A9C7;
//     ThunderRandomLibraryInterface internal RNGLibrary;

//     constructor() {
//         RNGLibrary = ThunderRandomLibraryInterface(randomNumberContractAddress);
//     }

//     function CallRand() external returns (uint256) {
//         uint256 randomNumber = RNGLibrary.rand();
//         emit rand(randomNumber % 100);
//         return randomNumber % 100;
//     }
// }





// interface ThunderRandomLibraryInterface {
//     function rand() external returns (uint256);
// }