 
create an .env file according to the format of the .env.example file.

deploy 👇

```shell
npx hardhat run scripts/deploy.js --network [network]
```

If the network you want doesn't exist, add it to `hardhat.config.js`

Testnet Seedsale contract deployed address : 0x910035CaE5Ea630E2B0327E42FD42867972A193B

For deploying and verifying on mainnet ARB use the below commands.

```shell
npx hardhat run scripts/deploy.js --network arb
```

```shell
npx hardhat verify --network arbtest <deployedaddress>  <depositAddress>
```

Then to Enable/Start the seedsale - go to https://arbiscan.io/address/<deployedaddress>

And go to Code tab to start the seedsale.