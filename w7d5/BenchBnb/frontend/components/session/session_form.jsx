import React from 'react';
import { Link, withRouter } from 'react-router-dom';

class SessionForm extends React.Component {

	constructor(props) {
		super(props);
		this.state = {
			username: "",
			password: ""
		};
		this.handleSubmit = this.handleSubmit.bind(this);
		this.update = this.update.bind(this);
  }

	update(key) {
		return event => this.setState({ [key]: event.currentTarget.value });
	}

	handleSubmit(event) {
		event.preventDefault();
    const user = Object.assign({}, this.state);
    this.props.processForm(user);
	}

	render() {
		const { formType, loggedIn } = this.props;
		return (
			<div>
				<header>
					{ formType === 'login' ? <h1>Log In</h1> : <h1>Sign Up</h1>}
				</header>
				<form onSubmit={ this.handleSubmit }>
					<label>Username:
						<input type="text" onChange={ this.update('username') } value={ this.state.username } />
					</label>
					<label>Password:
						<input type="password" onChange={ this.update('password') } value={ this.state.password } />
					</label>
					{ formType === 'login' ? <Link to='/login'>Log In</Link> : <Link to='/signup'>Sign Up</Link>}
				</form>
			</div>
		);
	}

}

export default SessionForm;
