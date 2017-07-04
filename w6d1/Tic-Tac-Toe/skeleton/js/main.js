const View = require('./ttt-view.js');
const Game = require('./game.js');

$( () => {
  const game = new Game();
  let $containerEl = $('.ttt');
  const view = new View(game, $containerEl);
});
