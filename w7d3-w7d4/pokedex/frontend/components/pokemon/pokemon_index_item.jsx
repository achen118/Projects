import React from 'react';
import { Link } from 'react-router-dom';

const PokemonIndexItem = ({ pokemon }) => {
  return (
    <li>
      <Link key={ pokemon.id } to={ `/pokemon/${pokemon.id}` }>
        { pokemon.name }
        <img height="100" width="100" src={ pokemon.image_url } />
      </Link>
    </li>
  );
};

export default PokemonIndexItem;
