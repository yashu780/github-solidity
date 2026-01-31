//SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;
contract todo{
    struct list{
        string text;
        bool complete;

    }
    list[] public todos;
    function create(string calldata _text) external{
        todos.push(list({
            text:_text,
            complete:false
        }));
    }
    function update(uint index,string calldata _text) external{
        todos[index].text=_text;

    }
    function get(uint index) external view returns(string memory,bool){
        list storage tode = todos[index];
        return (tode.text,tode.complete);

    }
    function toggleComplete(uint index) external {
        todos[index].complete=!todos[index].complete;
    }
}