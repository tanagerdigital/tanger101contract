const { ethers, upgrades } = require("hardhat");

async function main() {
//const [owner] = await ethers.getSigners();

  const Ta = await ethers.getContractFactory("Tanager101");
  const t = await Ta.deploy()
  console.log(t.address)

}

main();