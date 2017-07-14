import React from 'react';
import ItemDetailContainer from './item_detail_container';
import { Link, Route } from 'react-router-dom'

class PokemonDetail extends React.Component {
  componentDidMount() {
    this.props.requestSinglePokemon(this.props.match.params.pokemonId);
  }

  componentWillReceiveProps(newProps) {
    if (this.props.match.params.pokemonId !== newProps.match.params.pokemonId) {
      this.props.requestSinglePokemon(newProps.match.params.pokemonId)
    }
  }

  constructor(props) {
    super(props);
  }

  render() {
    if (this.props.pokemon) {
      const { pokemon, items } = this.props.pokemon;
      const pokemonItems = items.map( (item, idx) => (
          <Link to={`/pokemon/${pokemon.id}/items/${item.id}`} key={idx} >
            <li>{ item.name }</li>
          </Link>
      ));

      return (
        <div>
          <img src={ pokemon.image_url } />
          <h1>{ pokemon.name }</h1>
          <ul>
            <li>Type: { pokemon.poke_type }</li>
            <li>Attack: { pokemon.attack }</li>
            <li>Defense: { pokemon.defense }</li>
            <li>Moves: { pokemon.moves.join(", ") }</li>

            <ul>Items: { pokemonItems }</ul>
            <Route exact path="/pokemon/:pokemonId/items/:itemId"
              component={ ItemDetailContainer } />
          </ul>
        </div>
      );
    } else {
      return <h1>nope</h1>
    }
  }
}

export default PokemonDetail;
