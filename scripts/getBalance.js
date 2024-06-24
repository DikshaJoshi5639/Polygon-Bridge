const hre = require("hardhat");
const tokenContractJSON = require("../artifacts/contracts/Mytoken.sol/Mytoken.json");

const tokenAddress = "0xA65EF105e53F53634117EC39610559713A3d6019"; // Ethereum address of the deployed ERC721A contract
const tokenABI = tokenContractJSON.abi;
const walletAddress = "0xaD43530063B452111eCE74c1541B9dCb4D9450f3"; // Ethereum public address for the wallet

async function main() {

    const token = await hre.ethers.getContractAt(tokenABI, tokenAddress);

    console.log("You now have a total number of: " + await token.balanceOf(walletAddress) + " tokens in the wallet.");
  }
  
  main().catch((error) => {
    console.error(error);
    process.exitCode = 1;
  });
