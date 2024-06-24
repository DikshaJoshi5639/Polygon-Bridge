# Polygon-Bridge

In this project, I was tasked to deploy an NFT collection on the Ethereum blockchain, Map the collection to Polygon, and Transfer assets over via the Polygon Bridge.

## Getting Started

### Executing program
To run the code you can use gitpod online platform using the link https://www.gitpod.io/

### Deploying the ERC721 Contract

Before deploying, make sure to rename ".env.example" to ".env" and provide your wallet private key where required i.e. "PRIVATE_KEY= 'your wallet private key'". Run the following command to deploy the ERC721 contract to the sepolia Ethereum Testnet: 
As the goerli testnet has been deprecated so I am using sepolia.

``` 
npx hardhat run scripts/DEPLOY.js --network sepolia 
```
## NOTE:
After deploying the address will generate. So, copy that address into `contarctAddress.js`(stored in metadata folder) and also in `MINT.js`(stored in scripts folder)
 
The script will deploy the contract 
### Batch Mint NFTs

Run the following command to MINT NFTs using the deployed ERC721 contract:

``` 
npx hardhat run scripts/MINT.js --network sepolia
```

The script will mint the specified number of NFTs and assign them to your address.

### Approve and Deposit NFTs to Polygon Testnet
Mumbai Testnet has been deprecated and I used the Amoy testnet but hardhat does not have features to run with AMOY testnet.

Run the following commands to approve and deposit the minted NFTs from Ethereum testnet sepolia.
```
npx hardhat run scripts/TransferTokens.js --network sepolia
```

## License

This project is licensed under the [MIT License]
