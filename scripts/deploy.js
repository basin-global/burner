// scripts/deploy.js

async function main() {
    console.log("Starting deployment...");
    
    const SitusMetadata = await ethers.getContractFactory("SitusMetadata");
    console.log("Contract factory created");
    
    const situsMetadata = await SitusMetadata.deploy();
    console.log("Deployment transaction sent");
    
    await situsMetadata.deployed();
    console.log("SitusMetadata deployed to:", situsMetadata.address);
}

main()
    .then(() => process.exit(0))
    .catch((error) => {
        console.error(error);
        process.exit(1);
    });
