import React from 'react';
import PokemonIndexItem from './pokemon_index_item'
import { Route } from 'react-router-dom';
import PokemonDetailContainer from './pokemon_detail_container';
import PokemonFormContainer from './pokemon_form_container';

class PokemonIndex extends React.Component {
  componentDidMount() {
    this.props.requestAllPokemon();
  }

  constructor(props) {
    super(props);
  }

  render() {
    const { pokemon } = this.props;
    const pokemonItems = pokemon.entities.map( pokemon => (
        <PokemonIndexItem key={ pokemon.id } pokemon={ pokemon } />
      ));
    return (
      <div>
        <ul>
          { pokemonItems }
        </ul>
        <Route exact path='/pokemon' component={ PokemonFormContainer } />
        <Route path='/pokemon/:pokemonId'
          component={ PokemonDetailContainer } />
      </div>
    );
  }
}

export default PokemonIndex;
