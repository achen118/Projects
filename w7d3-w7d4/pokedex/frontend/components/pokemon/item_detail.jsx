import React from 'react';

const ItemDetail = (props) => {
  return (
    <div>
      <img width="100" height="100" src={ props.item.image_url } />
      <li>Name: { props.item.name }</li>
      <li>Happiness: { props.item.happiness }</li>
      <li>Price: { props.item.price }</li>
    </div>
  )
}

export default ItemDetail;
