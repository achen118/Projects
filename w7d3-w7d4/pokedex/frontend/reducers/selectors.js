import { values } from 'lodash';

export const selectAllPokemon = state => {
  return _.values(state.pokemon.entities)
}

export const selectPokemonItem = (state, itemId) => {
  let selectedItem;
  state.pokemon.entities[state.pokemon.currentPoke].items.forEach((item) => {
    if (item.id == itemId) {
      selectedItem = item;
    }
  });
  return selectedItem;
}
