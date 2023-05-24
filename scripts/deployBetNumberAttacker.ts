import { ethers } from "hardhat";

async function main() {
  // ethers.utils.parseEther("10") = 10 TT
  const contractBalance = 10; // 10 token

  const BetNumber = await ethers.getContractFactory("BetNumberAttacker");
  const example = await BetNumber.deploy({ value: contractBalance });

  await example.deployed();

  console.log(
    `Submit ${ethers.utils.formatEther(contractBalance)} TT and deployed to ${example.address}`
  );
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
