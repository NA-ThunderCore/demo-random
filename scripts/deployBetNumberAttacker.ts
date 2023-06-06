import { ethers } from "hardhat";

async function main() {
  // ethers.utils.parseEther("10") = 10 TT
  const contractBalance = 10; // 10 wei token

  const Attacker = await ethers.getContractFactory("BetNumberAttacker");
  const attacker = await Attacker.deploy({ value: contractBalance });

  await attacker.deployed();

  console.log(
    `Submit ${ethers.utils.formatEther(contractBalance)} TT and deployed to ${attacker.address}`
  );
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
