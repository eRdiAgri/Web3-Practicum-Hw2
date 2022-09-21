//SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract TodoList { //Define variables
    struct Todo {
        string text;
        bool completed;
    }

    Todo[] public todos;

    function create(string calldata _text) external {
        todos.push(Todo({ //Create list but define it as not completed.
            text: _text,
            completed: false
        }));
    }

    function updateText(uint _index, string calldata _text) external {
        todos[_index].text = _text; //Update the todos list text

        Todo storage todo = todos[_index];
        todo.text = _text;
    }

    function get(uint _index) external view returns (string memory, bool) {
        Todo storage todo = todos[_index]; //storage gas optimisation
        return (todo.text, todo.completed);
    }

    function toggleCompleted(uint _index) external { //Completed session
        todos[_index].completed = !todos[_index].completed;
    }
}
