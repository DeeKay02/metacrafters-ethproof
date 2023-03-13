const hre = require("hardhat");

async function main() {
    await hre.run("compile");
    const Gameing = await hre.ethers.getContractFactory("Game");
    const gameing = await Gameing.deploy();
    await gameing.deployed();
    console.log("CONTRACT ADDRESS: ", gameing.address);
}

main().catch((error) => {
    console.error(error);
    process.exitCode = 1;
});