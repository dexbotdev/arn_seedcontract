require("@nomicfoundation/hardhat-toolbox");
require("dotenv").config();

const bscTestnet = {
  url: "https://data-seed-prebsc-1-s1.binance.org:8545/",
  chainId: 97,
  accounts: [process.env.PRIVATE_KEY],
};

const bscMainnet = {
  url: "https://bsc-dataseed.binance.org/",
  chainId: 56,
  accounts: [process.env.PRIVATE_KEY],
};

const arb = {
  url: "https://arb1.arbitrum.io/rpc",
  chainId: 42161,
  accounts: [process.env.PRIVATE_KEY],
};
const arbtest = {
  url: "https://goerli-rollup.arbitrum.io/rpc",
  chainId: 421613,
  accounts: [process.env.PRIVATE_KEY],
};
/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.17",
  networks: {
    bscTestnet,
    bscMainnet,
    arb,
    arbtest
  },
  etherscan: {
    apiKey: {
      arbitrumGoerli: 'NV6614SZM1P3EB3YKUTRNWWV6V81Y17EA7',
      arbitrumOne:'NV6614SZM1P3EB3YKUTRNWWV6V81Y17EA7'
    }
  }
};
