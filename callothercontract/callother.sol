//SPDX-License-Identifier:MIT
pragma solidity^0.8.10;
contract testFromGod{
    function setx(god _test, uint _x) external{
        _test.setx(_x);
    }
    function getx(address _test) external view returns(uint x){
        x= god(_test).getx();

    }
    function payWithEther(address _test, uint _x) external payable {
        god (_test).payWithEther{value :msg.value}(_x);
    }
    function getxandvalue(address _test) external view returns (uint x , uint value){
        ( x, value)= god(_test).getxandvalue();
       
    }
}


contract god{
     uint public x;
    uint public value=123;
function setx(uint _x) external {
    x =_x;
}
function getx() view external returns(uint){
    return x;
}
function payWithEther(uint _x) payable external{
x=_x;
value= msg.value;
}
function getxandvalue() external view returns(uint,uint){
    return(x,value);
}
}