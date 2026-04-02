import { ethers } from "https://cdn.jsdelivr.net/npm/ethers@6.6.2/+esm";

// 1. Contract Address (after deployment)
const CONTRACT_ADDRESS = "YOUR_CONTRACT_ADDRESS";

// 2. ABI (copy from your compiled contract)
const ABI = [
  "function createTweet(string memory _content) public",
  "function getAllTweets() public view returns (tuple(address author, string content)[])"
];

let provider;
let signer;
let contract;

// 🔌 Connect Wallet
export async function connectWallet() {
  if (!window.ethereum) {
    alert("Install MetaMask");
    return;
  }

  provider = new ethers.BrowserProvider(window.ethereum);
  await provider.send("eth_requestAccounts", []);
  signer = await provider.getSigner();

  contract = new ethers.Contract(CONTRACT_ADDRESS, ABI, signer);

  return await signer.getAddress();
}

// 📝 Post Tweet (write)
export async function postTweet(content) {
  const tx = await contract.createTweet(content);
  await tx.wait();
  return tx.hash;
}

// 📥 Get Tweets (read)
export async function getTweets() {
  const tweets = await contract.getAllTweets();
  return tweets;
}