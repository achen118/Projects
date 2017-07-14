import React from 'react';
import merge from 'lodash/merge';

class PokemonForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      pokemon: {
        name: "alice",
        attack: "",
        defense: "",
        poke_type: "",
        moves: [],
        move1: "",
        move2: "",
        move3: "",
        move4: "",
        image_url: ""
      }
    };
    // this.TYPES = [
    //   "fire",
    //   "electric",
    //   "normal",
    //   "ghost",
    //   "psychic",
    //   "water",
    //   "bug",
    //   "dragon",
    //   "grass",
    //   "fighting",
    //   "ice",
    //   "flying",
    //   "poison",
    //   "ground",
    //   "rock",
    //   "steel"
    // ];
    this.handleChange = this.handleChange.bind(this);
    this.handleClick = this.handleClick.bind(this);
  }

  handleChange(key) {
    const newState = merge({}, this.state);
    newState.pokemon[key] = event.currentTarget.value;
    this.setState(newState);
  }

  handleClick(event) {
    event.preventDefault();
    const { move1, move2, move3, move4 } = this.state.pokemon;
    this.setState({ pokemon: { moves: [move1, move2, move3, move4] }});
    this.props.createPokemon(this.state.pokemon).then(
      this.setState({
        pokemon: {
          name: "",
          attack: "",
          defense: "",
          poke_type: "",
          moves: [],
          move1: "",
          move2: "",
          move3: "",
          move4: "",
          image_url: ""
        }
      })
    )
  }

  render() {
    const { pokemon } = this.state;
    // const typeOptions = this.TYPES.map((type, idx) => (
    //   <option key={ idx } value={ type }>
    //     { type }
    //   </option>
    // ));
    return (
      <form onSubmit={this.handleClick}>
        <label htmlFor="name">Name</label>
          <input id="name" type="text" value={this.state.pokemon.name} onChange={() => this.handleChange('name')} />
        <label>Image URL
          <input type="text" value={ pokemon.image_url } onChange={ () => this.handleChange('image_url') } />
        </label>
        <label>
          <select defaultValue="default">
            <option key="100" value="default" disabled="true">Choose a Type:</option>

          </select>
        </label>
        <label>Attack
          <input type="text" value={ pokemon.attack } onChange={ () => this.handleChange('attack') } />
        </label>
        <label>Defense
          <input type="text" value={ pokemon.defense } onChange={ () => this.handleChange('defense') } />
        </label>
        <label>Move 1
          <input type="text" value={ pokemon.move1 } onChange={ () => this.handleChange('move1') } />
        </label>
        <label>Move 2
          <input type="text" value={ pokemon.move2 } onChange={ () => this.handleChange('move2') } />
        </label>
        <label>Move 3
          <input type="text" value={ pokemon.move3 } onChange={ () => this.handleChange('move3') } />
        </label>
        <label>Move 4
          <input type="text" value={ pokemon.move4 } onChange={ () => this.handleChange('move4') } />
        </label>
        <button>Create Pokemon</button>
      </form>
    );
  }
}

export default PokemonForm;
