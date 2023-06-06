// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

interface ThunderRandomLibraryInterface {
    function rand() external returns (uint256);
}

contract BetNumber {
    // Random precompiled contract address is 0x8cC9C2e145d3AA946502964B1B69CE3cD066A9C7
    address constant public randomNumberContractAddress = 0x8cC9C2e145d3AA946502964B1B69CE3cD066A9C7;
    ThunderRandomLibraryInterface internal RNGLibrary;
    event didWin(bool);
    uint256 public balance;

    constructor() payable{
        RNGLibrary = ThunderRandomLibraryInterface(randomNumberContractAddress);
        balance = address(this).balance;
    }

    function betNumber(uint256 bet) external payable returns (bool) {
        uint256 randomNumber = RNGLibrary.rand() % 100;
        if (bet <= randomNumber) {
            address payable sender = payable(msg.sender);
            sender.transfer(msg.value+1);
            balance = balance - 1;
            emit didWin(true);
            return true;
        }
        balance = balance + msg.value;
        emit didWin(false);
        return false;
    }
}
