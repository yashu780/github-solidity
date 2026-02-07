// eth can be sent via 3 methods transfer, call,send
// transfer:2300 gas,revert
//send:2300 gas,returns bool
// call:all gas, returns bool and data
//SPDX-License-Identifier:MIT
pragma solidity^0.8.10;
contract sendeth{
    constructor()payable {}
    receive()external payable{}//fallback also
    function sendViaTransfer(address payable _to) external payable{
        _to.transfer(123);
    }
    function sendViaSend(address payable _to) external payable{
       bool sent = _to.send(123);
       require (sent,"sent failed");
    }
function sendViaCall(address payable _to) payable external{
  ( bool success, )=_to.call{value:123}("") ;
require(success,"call failed");
}

}
contract ethReciever{
event log(uint amount,uint gas);
receive ()external payable{
    emit log(msg.value, gasleft());
}
}