const Util = require('./util.js');
const MovingObject = require('./moving_object.js');

function Asteroid (position, game) {
  this.position = position;
  this.game = game;
  let COLOR = 'yellow';
  let RADIUS = 30;
  MovingObject.call(this, {color: COLOR, radius: RADIUS, vel: Util.randomVec(20), pos: this.position, game: this.game});
}

Util.inherits(Asteroid, MovingObject);

module.exports = Asteroid;
