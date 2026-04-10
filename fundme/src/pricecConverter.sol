// SPDX-License-Identifier:MIT
pragma solidity ^0.8.10;
import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";
library priceconvertor {
    function getprice() internal view returns(uint256){
        // address:0x694AA1769357215DE4FAC081bf1f309aDC325306
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        (,int256 price,,,)= priceFeed.latestRoundData();
        return uint256(price * 1e18);
    }
    function getConversionRate(uint256 ethAmount) internal view returns(uint256) {
        uint256 ethPrice = getprice();
        uint256 ethAmountinUse=(ethPrice * ethAmount)/1e18;
        return ethAmountinUse;
    }
    function getversion() internal view returns(uint256){
        return AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306).version();
    }
    
}