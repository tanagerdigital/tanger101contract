require("@nomicfoundation/hardhat-toolbox");
require('dotenv').config();

const web3_api_key = process.env.WEB3_API_KEY
const polygon_scan_api_key = process.env.POLYGON_SCAN_API_KEY

module.exports = {
  solidity: "0.8.17",
  networks: {
    mumbai: {
      url: `https://polygon-mumbai.infura.io/v3/${web3_api_key}`,
      accounts: [
        process.env.POLYGON_1
      ]
    },
    polygon:{
      url: `https://polygon-mainnet.infura.io/v3/${web3_api_key}`,
      accounts: [
        process.env.POLYGON_1
      ]
    }
  },
  etherscan: {
    apiKey: {
      polygon: `${polygon_scan_api_key}`,
      polygonMumbai: `${polygon_scan_api_key}`
    }
  }
};
