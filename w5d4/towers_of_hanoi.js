const readline = require("readline");
const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

class Game {

  constructor() {
    this.stacks = [[1,2,3],[],[]];
  }

  promptMove(callback) {
    reader.question("Which tower do you want to move from: ", (startTowerIdx) => {
      reader.question("Which tower do you want to move to: ", (endTowerIdx) => {
        callback(startTowerIdx, endTowerIdx);
      });
    });
  }

  isValidMove(startTowerIdx, endTowerIdx) {
    if (this.stacks[startTowerIdx].length === 0) {
      return false;
    } else if (this.stacks[endTowerIdx][0] < this.stacks[startTowerIdx][0]) {
      return false;
    } else {
      return true;
    }
  }

  move(startTowerIdx, endTowerIdx) {
    if (this.isValidMove(startTowerIdx, endTowerIdx)) {
      let disk = this.stacks[startTowerIdx].shift();
      this.stacks[endTowerIdx].push(disk);
      console.log(this.stacks);
      return true;
    } else {
      return false;
    }
  }

  print() {
    console.log(JSON.stringify(this.stacks));
  }

  isWon() {
    if (this.stacks[0].length === 0 && (this.stacks[1].length === 0 || this.stacks[2].length === 0)) {
      return true;
    } else {
      return false;
    }
  }

  run(completionCallback) {
    this.promptMove((from, to) => {
      if (!this.move(from, to)) {
        console.log("Not a valid move");
      }
      if (this.isWon()) {
        completionCallback();
      } else {
        this.run(completionCallback);
      }
    });
  }
}

const game = new Game();
// console.log(game.move(0, 1));
game.run(() => {
  console.log("You win!");
  reader.close();
});
