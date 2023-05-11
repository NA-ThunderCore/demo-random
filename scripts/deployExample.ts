import { ethers } from "hardhat";

async function main() {
  const Example = await ethers.getContractFactory("Example");
  const example = await Example.deploy();

  await example.deployed();

  console.log(
    `Deployed address ${example.address}`
  );
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
