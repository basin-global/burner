require("dotenv").config();
require("@nomiclabs/hardhat-ethers");
require("@nomicfoundation/hardhat-verify");

module.exports = {
  solidity: {
    compilers: [{
      version: "0.8.20",
      settings: {
        optimizer: {
          enabled: true,
          runs: 200
        },
        evmVersion: "london",
        viaIR: false,
      }
    }]
  },
  networks: {
    baseMainnet: {
      url: "https://mainnet.base.org",
      accounts: [`0x${process.env.DEPLOYER_PRIVATE_KEY}`],
      chainId: 8453
    }
  },
  etherscan: {
    apiKey: process.env.BASESCAN_API_KEY,
    customChains: [
      {
        network: "baseMainnet",
        chainId: 8453,
        urls: {
          apiURL: "https://api.basescan.org/api",
          browserURL: "https://basescan.org"
        }
      }
    ]
  }
};
