// SPDX-License-Identifier:MIT
pragma solidity ^0.8.10;
 contract twitter{
    uint16  public MAX_TWEET_LENGTH = 280;
    struct Tweet{
        uint256 id;
        address author;
        string content;
        uint256 timestamp;
        uint256 likes;
        uint256 dislike;
    }
    mapping(address => Tweet[]) public tweets;
    address public owner;
    constructor(){
        owner = msg.sender;

    }
    modifier onlyOwner() {
        require(msg.sender == owner,"YOU ARE NOT THE OWNER");
        _;
    }
    function changeTweetLength(uint16 newTweetLength) public onlyOwner{
        MAX_TWEET_LENGTH = newTweetLength;
    }
    function createTweets(string memory _tweet) public{
         require(bytes(_tweet).length <= MAX_TWEET_LENGTH, "tweet se too long blockchain me paisa lgta hai!" );
       Tweet memory newTweet = Tweet({
       id: tweets[msg.sender].length,
        author: msg.sender,
        content: _tweet,
        timestamp:block.timestamp,
        likes:0,
        dislike:0
       });
        tweets[msg.sender].push(newTweet);
    }
    function likeTweet(address author,uint256 id) external{
        require(tweets[author][id].id ==id,"Tweet does not exist");
        tweets[author][id].likes++;

    }
    function dislikeTweet(address author,uint256 id) external {
        require(tweets[author][id].id ==id,"Tweet does not exist");
        require(tweets[author][id].likes>0,"Tweet has no likes");
        tweets[author][id].likes--;
    }

    function getTweet(uint256 _i)public view returns(Tweet memory ){
        return tweets[msg.sender][_i];
    }
    function getAllTweets(address _addr) public view returns(Tweet[] memory){
        return tweets[_addr];
    }
 }
