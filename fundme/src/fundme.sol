// SPDX-License-Identifier:MIT
pragma solidity ^0.8.30;
import {priceconvertor} from "./;./pricecConverter.sol";
error NotOwner();
contract fundmeC{
    using  priceconvertor for uint256;
    uint256 public  constant minUsd =5e18;
    address[] public funders;
    address public immutable owner;//i_owner
    mapping (address funder => uint256 AmountFunded) public addressToAmountFunded;
    function fund() public payable {
       // msg.value.getConversionRate();
       require(msg.value.getConversionRate() >= minUsd,"din't send enough eth");

        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] += msg.value;
     }
     constructor() {
        owner = msg.sender;

     }
     function withdraw() public onlyOwner {
       
      // for(/* starting index, ending index, step amount */) 
      //[1,10,2]
      //[1,3,5,7....]
      for(uint256 funderindex=0; funderindex < funders.length; fundersindex++){
        address funder = funders[funderindex];
        addressToAmountFunded[funder]=0;
      } 
      funders = new address[](0);
      // withdraw the funds
      // transfer, send , call
      //msg.sender=> address
      // payable(msg.sender)=> payable address
      payable (msg.sender).transfer(address(this).balance);
      //send
      bool sendsuccess = payable(msg.sender).send(address(this).balance);
      require(sendsuccess, "send failed!");
      //call
      (bool callSuccess, bytes memory datareturned )payable(msg.sender).call{value: address(this).balance}("");
      require(callSuccess, "call failed!")

     }
     modifier onlyOwner() {
       // require(msg.sender== owner,"sender is not owner!");
       if(msg.sender != owner){ revert NotOwner();}
        _;
     }
     // WHAT HAPPEN IF SOMEONE SEND THIS CONTRACT ETH 
     receive() external payable{
        fund();
     }
     fallback() external payable{
        fund();
     }
     
     }
    