import React from 'react';
import { Link } from 'react-router-dom';

class Greeting extends React.Component {

  constructor(props) {
    super(props);
    this.handleClick = this.handleClick.bind(this);
  }

  handleClick() {
    console.log(this.props);
    this.props.logout();
  }

  render() {
    const { currentUser } = this.props;
    if (currentUser) {
      return (
        <div>
          <h2>Hi {currentUser.username}, welcome to Bench BnB!</h2>
          <button onClick={ this.handleClick }>Logout</button>
        </div>
      );
    } else {
      return (
        <div>
          <Link to='/signup'>Sign Up</Link>
          <Link to='/login'>Log In</Link>
        </div>
      );
    }
  }

}

export default Greeting;
