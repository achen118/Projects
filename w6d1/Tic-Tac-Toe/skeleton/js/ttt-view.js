class View {
  constructor(game, $el) {
    this.game = game;
    this.$el = $el;
    this.setupBoard();
    this.bindEvents();
  }

  bindEvents() {
    const $cell = $('li');
    $cell.on("click", event => {
      const $clickedCell = $(event.currentTarget);
      const $clickedIdx = $cell.index($clickedCell);
      const $xPos = $clickedIdx % 3;
      const $yPos = Math.floor($clickedIdx / 3);
      try {
        this.game.playMove([$xPos, $yPos]);
        this.makeMove($clickedCell);
      } catch (e) {
        alert(e.msg);
      }

      if (this.game.isOver()){
        alert(`winner is ${this.game.winner()}`);
      }
    });
  }

  makeMove($square) {
    $square.addClass("white");
    const mark = this.game.currentPlayer;

    if (mark === 'o') {
      $square.addClass("green");
      $square.text('x');
    } else {
      $square.addClass("blue");
      $square.text('o');
    }
  }

  setupBoard() {
    const $grid = $('<ul></ul>');
    const $cell = $('<li></li>');
    $grid.append($cell);
    for (let i = 0; i < 8; i++) {
      $grid.append($cell.clone());
    }
    this.$el.append($grid);
  }
}

module.exports = View;
