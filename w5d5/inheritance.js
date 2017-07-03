Function.prototype.inherits = function(parent) {
  this.prototype = Object.create(parent.prototype);
  this.prototype.constructor = this;
};
console.log('yay');
console.log(' we have the deep unbdersadfnads');

function MovingObject () {
}
MovingObject.prototype.whatever = function () {
  console.log('whatever');
};

function Ship () {}
Ship.inherits(MovingObject);

function Asteroid () {
}
Asteroid.inherits(MovingObject);
Asteroid.prototype.somin = function () {
  console.log('hooo');
};

let asodifjoij = new Ship();
asodifjoij.whatever();

let rocky = new Asteroid();
rocky.somin();
