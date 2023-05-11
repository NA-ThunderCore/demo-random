// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

library LibThunderRNG {
    function rand() internal returns (uint256) {
        uint256[1] memory m;
        assembly {
            if iszero(call(not(0), 0x8cC9C2e145d3AA946502964B1B69CE3cD066A9C7, 0, 0, 0x0, m, 0x20)) {
                revert(0, 0)
            }
        }
        return m[0];
    }
}

contract RandomExample {
    event didWin(bool);
    uint256 public contractBalance;

    constructor() payable {
        contractBalance = uint256(msg.value);
    }

    function betNumber(uint256 bet) payable external returns (bool) {
        if (msg.value < 5) {
            contractBalance = contractBalance + msg.value;

            emit didWin(false);
            return false;
        }

        uint256 randomNumber = LibThunderRNG.rand();
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