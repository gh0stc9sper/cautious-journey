module.exports = {
  networks: {
    develop: {
      host: "127.0.0.1",
      port: 8545,
      network_id: "*",
      provider: function() {
        return new require("ganache").provider();
      }
    }
  },
  contracts_build_directory: "./contracts",
  compilers: {
    solc: {
      version: "^0.8.0"
    }
  }
};