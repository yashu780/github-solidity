// SPDX-License-Identifier:MIT
pragma solidity ^0.8.10;
 contract twitter{
    uint16 constant MAX_TWEET_LENGTH = 280;
    struct Tweet{
        address author;
        string content;
        uint256 timestamp;
        uint256 likes;
        uint256 dislike;
    }
    mapping(address => Tweet[]) public tweets;
    function createTweets(string memory _tweet) public{
         require(bytes(_tweet).length <= MAX_TWEET_LENGTH, "tweet se too long blockchain me paisa lgta hai!" );
       Tweet memory newTweet = Tweet({
       
        author: msg.sender,
        content: _tweet,
        timestamp:block.timestamp,
        likes:0,
        dislike:0
       });
        tweets[msg.sender].push(newTweet);
    }
    function getTweet(uint256 _i)public view returns(Tweet memory ){
        return tweets[msg.sender][_i];
    }
    function getAllTweets(address _addr) public view returns(Tweet[] memory){
        return tweets[_addr];
    }
 }
