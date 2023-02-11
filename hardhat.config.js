require("dotenv").config();
require("@nomiclabs/hardhat-ethers");
const { ALCHEMY_API, PRIVATE_KEY } = process.env;
module.exports = {
  solidity: {
    compilers: [{ version: "0.8.17",},],
  },
  networks: {
    goerli: { 
      url: ALCHEMY_API,
      accounts: [PRIVATE_KEY],
    },
  },
  paths: {
    sources: "./contracts",
  },
};