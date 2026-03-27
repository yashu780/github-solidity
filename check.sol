// SPDX-License-Identifier :MIT
pragma solidity ^0.8.10;
contract favouriteno{
    struct person{
        uint256 favnum;
        string name;
    }
    person public pat= person(6,"yashu");
    person[] public listofpeople; 
    uint256 public fnumber;
    function store(uint256 _fnumber) public{
        fnumber =_fnumber+1;
        fnumber= fnumber +1;
    }
    function retrieve() public view returns(uint256){
        return fnumber;
    }
     function addperson(uint256 _favnum,string memory _name) public{
        listofpeople.push( person(_favnum, _name));
        
     }
}