// scripts/deploy.js

async function main() {
    // Retrieve the contract factory
    const SitusMetadata = await ethers.getContractFactory("SitusMetadata");

    // Deploy the SitusMetadata contract
    const situsMetadata = await SitusMetadata.deploy();
    await situsMetadata.deployed();
    console.log("SitusMetadata deployed to:", situsMetadata.address);
}

main()
    .then(() => process.exit(0))
    .catch((error) => {
        console.error(error);
        process.exit(1);
    });
