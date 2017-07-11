import { connect } from 'react-redux';
import TodoList from './todo_list.jsx';
import { receiveTodo, removeTodo } from '../../actions/todo_actions';
import allTodos from '../../reducers/selectors';

const mapStateToProps = state => ({
  todos: allTodos(state)
});

const mapDispatchToProps = dispatch => ({
  receiveTodo: todo => dispatch(receiveTodo(todo)),
  removeTodo: todo => dispatch(removeTodo(todo))
});

window.removeTodo = removeTodo;
window.receiveTodo = receiveTodo;

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(TodoList);
