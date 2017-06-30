/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, {
/******/ 				configurable: false,
/******/ 				enumerable: true,
/******/ 				get: getter
/******/ 			});
/******/ 		}
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = 4);
/******/ })
/************************************************************************/
/******/ ([
/* 0 */
/***/ (function(module, exports) {

const Util = {
  inherits (childClass, parentClass) {
    childClass.prototype = Object.create(parentClass.prototype);
    childClass.prototype.constructor = childClass;
  }
};

Util.randomVec = function (length) {
  const deg = 2 * Math.PI * Math.random();
  return Util.scale([Math.sin(deg), Math.cos(deg)], length);
};

Util.scale = function (vec, m) {
  return [vec[0] * m, vec[1] * m];
};

module.exports = Util;


/***/ }),
/* 1 */
/***/ (function(module, exports) {

function MovingObject(options) {
  this.pos = options['pos'];
  this.vel = options['vel'];
  this.radius = options['radius'];
  this.color = options['color'];
  this.game = options['game'];
}

MovingObject.prototype.draw = function(ctx) {
  ctx.beginPath();
  ctx.arc(this.pos[0], this.pos[1], this.radius, 0, 2 * Math.PI);
  ctx.fillStyle = this.color;
  ctx.strokeStyle = this.color;
  ctx.fill();
  ctx.stroke();
};

MovingObject.prototype.move = function() {
  this.pos[0] += this.vel[0];
  this.pos[1] += this.vel[1];
  this.pos = this.game.wrap(this.pos);
};

module.exports = MovingObject;


/***/ }),
/* 2 */
/***/ (function(module, exports, __webpack_require__) {

const Util = __webpack_require__(0);
const MovingObject = __webpack_require__(1);

function Asteroid (position, game) {
  this.position = position;
  this.game = game;
  let COLOR = 'yellow';
  let RADIUS = 30;
  MovingObject.call(this, {color: COLOR, radius: RADIUS, vel: Util.randomVec(20), pos: this.position, game: this.game});
}

Util.inherits(Asteroid, MovingObject);

module.exports = Asteroid;


/***/ }),
/* 3 */
/***/ (function(module, exports, __webpack_require__) {

const Asteroid = __webpack_require__(2);
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


/***/ }),
/* 4 */
/***/ (function(module, exports, __webpack_require__) {

const GameView = __webpack_require__(5);

document.addEventListener("DOMContentLoaded", function(){
  const canvasEl = document.getElementById("game-canvas");
  const ctx = canvasEl.getContext("2d");
  let gg = new GameView (ctx);
  gg.start();
});

// I am rooooot


/***/ }),
/* 5 */
/***/ (function(module, exports, __webpack_require__) {

const Game = __webpack_require__(3);

const GameView = function(ctx) {
  this.game = new Game();
  this.ctx = ctx;
};

GameView.prototype.start = function () {
  setInterval(this.game.moveObjects.bind(this.game), 40);
  setInterval(this.game.draw.bind(this.game, this.ctx), 40);
};

module.exports = GameView;


/***/ })
/******/ ]);