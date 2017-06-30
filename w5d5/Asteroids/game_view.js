const Game = require('./game.js');

const GameView = function(ctx) {
  this.game = new Game();
  this.ctx = ctx;
};

GameView.prototype.start = function () {
  setInterval(this.game.moveObjects.bind(this.game), 40);
  setInterval(this.game.draw.bind(this.game, this.ctx), 40);
};

module.exports = GameView;
