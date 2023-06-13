import { HardhatUserConfig } from "hardhat/config";
import "@nomiclabs/hardhat-ethers";
import "@nomiclabs/hardhat-etherscan";
import "tt-hardhat";

const config: HardhatUserConfig = {
  solidity: "0.8.18",
  etherscan: {
    apiKey: {
      "thunder-testnet": "unused",
    },
    customChains: [
      {
       network: "thunder-testnet",
        chainId: 18,
        urls: {
          apiURL: "https://explorer-testnet.thundercore.com/api",
          browserURL: "https://explorer-testnet.thundercore.com",
        },
      },
    ],
  },
};

export default config;
