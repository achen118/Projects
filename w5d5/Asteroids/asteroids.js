const GameView = require('./game_view.js');

document.addEventListener("DOMContentLoaded", function(){
  const canvasEl = document.getElementById("game-canvas");
  const ctx = canvasEl.getContext("2d");
  let gg = new GameView (ctx);
  gg.start();
});

// I am rooooot
