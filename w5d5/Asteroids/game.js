const Asteroid = require('./asteroid.js');
let DIM_X = 800;
let DIM_Y = 600;

const Game = function () {
  let NUM_ASTEROIDS = 9;
  this.asteroids = [];
  for (let i = 0; i < NUM_ASTEROIDS; i++) {
    this.asteroids.push(this.addAsteroids());
  }
};

Game.prototype.randomPosition = function() {
  return [Math.floor(DIM_X * Math.random()), Math.floor(DIM_Y * Math.random())];
};

Game.prototype.addAsteroids = function () {
  return new Asteroid(this.randomPosition(), this);
};

Game.prototype.draw = function(ctx) {
  ctx.clearRect(0, 0, DIM_X, DIM_Y);
  this.asteroids.forEach(function(aster) {
    aster.draw(ctx);
  });
};

Game.prototype.moveObjects = function() {
  this.asteroids.forEach(function(aster) {
    aster.move();
  });
};

Game.prototype.wrap = function(pos) {
  if (pos[0] < 0) {
    pos[0] = 800;
  }
  if (pos[0] > 800) {
    pos[0] = 0;
  }
  if (pos[1] < 0) {
    pos[1] = 600;
  }
  if (pos[1] > 600) {
    pos[1] = 0;
  }
  return pos;
};

module.exports = Game;
