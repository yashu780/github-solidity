// X
// |
// Y
// |
// Z
// ORDER BECOME X-Y-Z, MEANS IF YOU WANT TO DO MULTIPLE INHERTANCE YOU SHOLD WRITE CONTRACT Z IS X,Y
// SPDX-License-Identifier:MIT
pragma solidity ^0.8.10;
contract x{
    function foo() public pure virtual returns(string memory){
        return "yeh multiple inheritance hai bawle";
    }
     function zoo()public pure virtual returns(string memory){
        return "only for x";
    }
}
contract y is x{
    function loo() public pure virtual returns(string memory){
        return"yeh foo ka child h";
    }
    function foo() public pure virtual override returns(string memory){
        return "yeh naya foo h";
    }
}
contract z is x , y{
    function loo() public pure  override(y) returns(string memory){
        return"yeh foo ke child ka child h";
    }
    function foo() public pure  override(x,y) returns(string memory){
        return "yeh naya foo se naya foo h";
    }
    function zoo()public pure override(x) returns(string memory){
        return "only for x and z";
    }
}