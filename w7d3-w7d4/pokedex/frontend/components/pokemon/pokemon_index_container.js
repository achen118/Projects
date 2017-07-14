import { connect } from 'react-redux';
import { requestAllPokemon, requestSinglePokemon } from '../../actions/pokemon_actions'
import { selectAllPokemon } from '../../reducers/selectors'
import PokemonIndex from './pokemon_index'


const mapStateToProps = state => ({
  pokemon: { entities: selectAllPokemon(state) },
  currentPoke: state.pokemon.currentPoke
});

const mapDispatchToProps = dispatch => ({
  requestAllPokemon: () => dispatch(requestAllPokemon()),
  requestSinglePokemon: pokemon => dispatch(requestSinglePokemon(pokemon))
})

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(PokemonIndex);
