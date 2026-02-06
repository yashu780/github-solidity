//SPDX-License-Identifier:MIT
pragma solidity ^0.8.10;
contract u{
     string public name;
    constructor(string memory _name){
        name=_name;
    }
}
contract c{
     string public text;
    constructor(string memory _text){
        text=_text;
    }
}
contract x is u("s"),c("t"){

}
contract y is u,c{
    constructor(string memory _name,string memory _text) u(_name) c(_text){

    }
}
contract xy is u,c("t"){
    constructor(string memory _name) u(_name){}
}