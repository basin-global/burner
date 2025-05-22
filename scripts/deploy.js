// scripts/deploy.js
const hre = require("hardhat");

async function main() {
    console.log("Starting deployment...");
    
    const Burner = await hre.ethers.getContractFactory("Burner");
    const burner = await Burner.deploy();
    
    await burner.waitForDeployment();
    
    console.log("Deployment transaction sent");
    console.log("Burner deployed to:", await burner.getAddress());
}

main()
    .then(() => process.exit(0))
    .catch((error) => {
        console.error(error);
        process.exit(1);
    });
