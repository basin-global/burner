// scripts/deploy.js

const { createPublicClient, http, createWalletClient, parseEther } = require('viem');

async function main() {
    console.log("Starting deployment...");
    
    const publicClient = await hre.viem.getPublicClient();
    const [wallet] = await hre.viem.getWalletClients();
    
    console.log("Contract factory created");
    
    const situsMetadata = await hre.viem.deployContract("SitusMetadata", [], {
        client: { public: publicClient, wallet }
    });
    
    console.log("Deployment transaction sent");
    console.log("SitusMetadata deployed to:", situsMetadata.address);
}

main()
    .then(() => process.exit(0))
    .catch((error) => {
        console.error(error);
        process.exit(1);
    });
