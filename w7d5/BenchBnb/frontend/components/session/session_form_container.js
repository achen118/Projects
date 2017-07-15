import { connect } from 'react-redux';
import SessionForm from './session_form';
import { login, signup } from '../../actions/session_actions';

const mapStateToProps = (state, ownProps) => {
  return {
    loggedIn: Boolean(state.currentUser),
    errors: state.errors,
    formType: ownProps.location.pathname === '/login' ? 'login' : 'signup'
  };
};

const mapDispatchToProps = (dispatch, ownProps) => {
  return {
    processForm: ownProps.formType === 'login' ? () => dispatch(login(ownProps.currentUser)) : () => dispatch(signup(ownProps.currentUser))
  };
};

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(SessionForm);