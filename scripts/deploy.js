// We require the Hardhat Runtime Environment explicitly here. This is optional
// but useful for running the script in a standalone fashion through `node <script>`.
//
// You can also run a script with `npx hardhat run <script>`. If you do that, Hardhat
// will compile your contracts, add the Hardhat Runtime Environment's members to the
// global scope, and execute the script.
const hre = require("hardhat");

async function main() {
  const ARNSeedSale = await hre.ethers.getContractFactory(
    "ARNSeedSale"
  );
  const arnseed = await ARNSeedSale.deploy("0xFa4896Cd653DEb1De02b93c4D7cf1039a13eFc6B");

  await arnseed.deployed();

  console.log("deployed contract "+ arnseed.address);
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
