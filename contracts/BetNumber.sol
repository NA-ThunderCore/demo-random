// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

interface ThunderRandomLibraryInterface {
    function rand() external returns (uint256);
}

contract BetNumber {
    // Random precompiled contract address is 0x8cC9C2e145d3AA946502964B1B69CE3cD066A9C7
    address constant public randomNumberContractAddress = 0x8cC9C2e145d3AA946502964B1B69CE3cD066A9C7;
    ThunderRandomLibraryInterface internal RNGLibrary;

    constructor() {
        RNGLibrary = ThunderRandomLibraryInterface(randomNumberContractAddress);
    }

    function betNumber(uint256 bet) external returns (bool) {
    }
}

// contract BetNumber {
//     // Random precompiled contract address is 0x8cC9C2e145d3AA946502964B1B69CE3cD066A9C7
//     address constant public randomNumberContractAddress = 0x8cC9C2e145d3AA946502964B1B69CE3cD066A9C7;
//     ThunderRandomLibraryInterface internal RNGLibrary;

//     constructor() {
//         RNGLibrary = ThunderRandomLibraryInterface(randomNumberContractAddress);
//     }

//     function betNumber(uint256 bet) external returns (bool) {
//     }
// }


// contract BetNumber {
//     event didWin(bool);
//     uint256 public contractBalance;
//     // Random precompiled contract address is 0x8cC9C2e145d3AA946502964B1B69CE3cD066A9C7
//     address constant public randomNumberContractAddress = 0x8cC9C2e145d3AA946502964B1B69CE3cD066A9C7;
//     ThunderRandomLibraryInterface internal RNGLibrary;

//     constructor() payable {
//         contractBalance = uint256(msg.value);
//         RNGLibrary = ThunderRandomLibraryInterface(randomNumberContractAddress);
//     }

//     function betNumber(uint256 bet) payable external returns (bool) {
//         uint256 randomNumber = RNGLibrary.rand();
//         address payable sender = payable(msg.sender);
//         if (bet < randomNumber) {
//             sender.transfer(msg.value+1);
//             emit didWin(true);
//             contractBalance = contractBalance - (msg.value+1);
//             return true;
//         }

//         contractBalance = contractBalance + msg.value;
//         emit didWin(false);
//         return false;
//     }
// }

// yarn hardhat console --network thunder-testnet
// const BetNumber = await ethers.getContractFactory("BetNumber");
// const b = BetNumber.attach("0xCB68554F995C45AB7B7e238b19826cFEf964a1e5")
// await b.contractBalance()
// await b.betNumber(ethers.constants.MaxUint256 , {value: 10})
// await b.contractBalance()
// let f = b.filters.didWin()
// let b = await ethers.provider.getBlockNumber()
// await b.queryFilter(f, b - 1000, b)
// b.betNumber(1 , {value: 10})
