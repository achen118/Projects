import { RECEIVE_CURRENT_USER, RECEIVE_ERRORS } from '../actions/session_actions';
import merge from 'lodash/merge';

const defaultSession = {
  currentUser: null,
  errors: []
};

const SessionReducer = (state = defaultSession, action) => {
  Object.freeze(state);
  let nextState = merge({}, state);
  switch(action.type) {
    case RECEIVE_CURRENT_USER:
      nextState.currentUser = action.currentUser;
      nextState.errors = [];
      return nextState;
    case RECEIVE_ERRORS:
      nextState.errors = action.errors;
      nextState.currentUser = null;
      return nextState;
    default:
      return state;
  }
};

export default SessionReducer;
