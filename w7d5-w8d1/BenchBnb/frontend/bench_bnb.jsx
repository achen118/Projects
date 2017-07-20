import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';
import Root from './components/root';
import { login } from './actions/session_actions';
import { fetchBenches } from './actions/bench_actions';

document.addEventListener('DOMContentLoaded', () => {
  let store;
  if (window.currentUser) {
    const preloadedState = { session: { currentUser: window.currentUser }};
    store = configureStore(preloadedState);
  } else {
    store = configureStore();
  }

  window.dispatch = store.dispatch;
  window.getState = store.dispatch;
  window.fetchBenches = fetchBenches;

  const root = document.getElementById('root');
  ReactDOM.render(<Root store={ store } />, root);
});
