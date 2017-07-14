import { RECEIVE_ALL_POKEMON } from '../actions/pokemon_actions'
import { RECEIVE_ONE_POKEMON } from '../actions/pokemon_actions'
import merge from 'lodash/merge';

const defaultState = {
  entities: {},
  currentPoke: null
}

const pokemonReducer = (state = defaultState, action) => {
  const newState = merge({}, state);
  switch (action.type) {
    case RECEIVE_ALL_POKEMON:
      newState.entities = action.pokemon;
      return newState;
    case RECEIVE_ONE_POKEMON:
      const { id } = action.pokemon;
      newState.entities[id] = action.pokemon;
      newState.currentPoke = id;
      return newState;
    default:
      return state;
  }
}

export default pokemonReducer;
