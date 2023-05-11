// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

interface ThunderRandomLibraryInterface {
    function rand() external returns (uint256);
}

contract Example {
    event rand(uint256);
    address constant public randomNumberContractAddress = 0x8cC9C2e145d3AA946502964B1B69CE3cD066A9C7;
    ThunderRandomLibraryInterface internal RNGLibrary;

    constructor() {
        RNGLibrary = ThunderRandomLibraryInterface(randomNumberContractAddress);
    }

    function CallRand() external returns (uint256) {
        uint256 randomNumber = RNGLibrary.rand();
        emit rand(randomNumber % 100);
        return randomNumber % 100;
    }
}

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

contract BetNumberExample {
    event didWin(bool);
    uint256 public contractBalance;
    // Random precompiled contract address is 0x8cC9C2e145d3AA946502964B1B69CE3cD066A9C7
    address constant public randomNumberContractAddress = 0x8cC9C2e145d3AA946502964B1B69CE3cD066A9C7;
    ThunderRandomLibraryInterface internal RNGLibrary;

    constructor() payable {
        contractBalance = uint256(msg.value);
        RNGLibrary = ThunderRandomLibraryInterface(randomNumberContractAddress);
    }

    function betNumber(uint256 bet) payable external returns (bool) {
        uint256 randomNumber = RNGLibrary.rand();
        address payable sender = payable(msg.sender);
        if (bet < randomNumber) {
            sender.transfer(msg.value+1);
            emit didWin(true);
            contractBalance = contractBalance - (msg.value+1);
            return true;
        }

        contractBalance = contractBalance + msg.value;
        emit didWin(false);
        return false;
    }
}