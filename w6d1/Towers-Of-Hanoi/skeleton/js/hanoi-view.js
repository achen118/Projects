class View {
  constructor(game, el) {
    this.game = game;
    this.el = el;
    this.setupTowers();
    this.render();
    const $towers = $('ul');

      $towers.on('click',(e) => {
        console.log("text");
        const $clickedTower = $(e.currentTarget);
        const idx = $towers.index($clickedTower);
        if (this.fromTowerIdx) {
          try {
          game.move(this.fromTowerIdx, idx);
          this.render();
          this.fromTowerIdx = null;
        } catch (err) {
          alert(err.msg);
        }

        } else {
          this.fromTowerIdx = idx;
        }
      });

  }

  setupTowers() {
    const $tower = $('<ul></ul>');
    for (let i = 0; i < 3; i++) {
      this.el.append($tower.clone());
    }
    const $disk = $('<li></li>');
    const $towers = $('ul');
    for (let i = 0; i < 3; i++) {
      $towers.eq(0).append($disk.clone());
    }
  }

  render() {
    const currTowers = this.game.towers;
    const $disk = $('<li></li>');
    const $towers = $('ul');
    currTowers.forEach((el, idx1) => {
      if (el.length === 0) {
        $towers.eq(idx1).empty();
      } else {
        $towers.eq(idx1).empty();
        el.forEach((diskVal, idx2) => {
          const $cloneDisk = $disk.clone();
          $towers.eq(idx1).append($cloneDisk);
          if (diskVal === 1) {
            $cloneDisk.addClass('disk1');
          } else if (diskVal === 2) {
            $cloneDisk.addClass('disk2');
          } else {
            $cloneDisk.addClass('disk3');
          }
        });
      }
    });
  }
}



module.exports = View;
