import * as sessionAPIUtil from '../util/session_api_util';

export const RECEIVE_CURRENT_USER = "RECEIVE_CURRENT_USER";
export const RECEIVE_ERRORS = "RECEIVE_ERRORS";

export const receiveCurrentUser = currentUser => {
  return {
    type: RECEIVE_CURRENT_USER,
    currentUser
  };
};

export const receiveErrors = errors => {
  return {
    type: RECEIVE_ERRORS,
    errors
  };
};

export const login = user => dispatch => {
  return sessionAPIUtil.login(user)
    .then(currentUser => dispatch(receiveCurrentUser(currentUser)));
};

export const logout = () => dispatch => {
  return sessionAPIUtil.logout()
    .then(() => dispatch(receiveCurrentUser(null)));
};

export const signup = user => dispatch => {
  return sessionAPIUtil.signup(user)
    .then(currentUser => dispatch(receiveCurrentUser(currentUser)));
};
