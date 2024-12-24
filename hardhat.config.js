require("@nomicfoundation/hardhat-toolbox");

module.exports = {
  solidity: {
    version: "0.8.3",
    settings: { evmVersion: "berlin" } // match your node's EVM
  },
  networks: {
    subtensorEvm: {
      url: "http://127.0.0.1:9944",
      chainId: 0,
      accounts: ["0x5fb92d6e98884f76de468fa3f6278f8807c48bebc13595d45af5bdc4da702133"]
    }
  }
};
