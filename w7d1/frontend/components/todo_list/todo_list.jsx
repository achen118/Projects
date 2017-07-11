import React from 'react';
import TodoListItem from './todo_list_item';
import TodoForm from './todo_form';
import uniqueId from '../../util/unique_id';

const TodoList = ({ todos, receiveTodo, removeTodo }) => {
  const todoListItems = todos.map((todo, idx) => (
    <TodoListItem key={ idx } todo={ todo } removeTodo={ removeTodo } receiveTodo={ receiveTodo } />
  ));
  return (
    <div>
      <ul>
        { todoListItems }
      </ul>
      <TodoForm receiveTodo={ receiveTodo } />
    </div>
  );
};



export default TodoList;


// { todos.map((todo) => <li>{todo.title}</li>) }
