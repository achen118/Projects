import React from 'react';
import merge from 'lodash/merge';

class TodoListItem extends React.Component {
  constructor(props) {
    super(props);
    this.handleDelete = this.handleDelete.bind(this);
    this.toggleDone = this.toggleDone.bind(this);
  }

  handleDelete(todo) {
    return (event => this.props.removeTodo(this.props.todo));
  }

  toggleDone() {
    const todo = merge({}, this.props.todo);
    todo.done = !this.props.todo.done;
    this.props.receiveTodo(todo);
  }

  render () {
    return (
      <li>
        { this.props.todo.title }
        <button onClick={this.handleDelete(this.props.todo)}>Delete</button>
        <button onClick={this.toggleDone}>{(this.props.todo.done ? "Undo" : "Done")}</button>
      </li>
    )
  }
}

export default TodoListItem;
