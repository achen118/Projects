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
/******/ 	return __webpack_require__(__webpack_require__.s = 0);
/******/ })
/************************************************************************/
/******/ ([
/* 0 */
/***/ (function(module, exports, __webpack_require__) {

const FollowToggle = __webpack_require__(1);
const UsersSearch = __webpack_require__(2);

$(() => {
  const $buttons = $('.follow-toggle');
  $buttons.each((idx, el) => {
    new FollowToggle(el, {});
  });
  const $usersSearches = $('.users-search');
  $usersSearches.each((idx, el) => {
    new UsersSearch(el);
  });
});


/***/ }),
/* 1 */
/***/ (function(module, exports, __webpack_require__) {

const APIUtil = __webpack_require__(3);

class FollowToggle {
  constructor(el, options) {
    this.$el = $(el);
    this.userId = this.$el.data("user-id") || options.userId;
    this.followState = this.$el.data("initial-follow-state") || options.followState;
    this.render();
    this.$el.on("click", this.handleClick.bind(this));
  }

  render() {
    this.$el.attr("disabled", false);
    if (this.followState === "following" || this.followState === "unfollowing") {
      this.$el.attr("disabled", true);
    }
    if (this.followState === "followed") {
      this.$el.text("Unfollow!");
    } else {
      this.$el.text("Follow!");
    }

  }

  handleClick(event) {
    event.preventDefault();
    if (this.followState === "followed") {
      this.followState = "unfollowing";
      this.render();
      APIUtil.unfollowUser(this.userId).then(() => {
        this.followState = "unfollowed";
        this.render();
      });
    } else {
      this.followState = "following";
      this.render();
      APIUtil.followUser(this.userId).then(() => {
        this.followState = "followed";
        this.render();
      });
    }

    // $.ajax({
    //   url: `/users/${this.userId}/follow`,
    //   method: this.followState === "followed" ? "DELETE" : "POST",
    //   dataType: "json",
    //   success: (() => {
    //     this.followState = (this.followState === "followed" ? "unfollowed" : "followed");
    //     this.render();
    //   })
    // });
  }
}

module.exports = FollowToggle;


/***/ }),
/* 2 */
/***/ (function(module, exports, __webpack_require__) {

const APIUtil = __webpack_require__(3);
const FollowToggle = __webpack_require__(1);

class UsersSearch {
  constructor(el) {
    this.$el = $(el);
    this.input = this.$el.find("input[name=query]");
    this.ul = this.$el.find(".users");
    this.input.on("input", this.handleInput.bind(this));
  }

  handleInput(event) {
    event.preventDefault();
    return APIUtil.searchUsers(this.input.val()).then(userArr => this.renderResults(userArr));
  }

  renderResults(userArr) {
    this.ul.empty();
    userArr.forEach(user => {
      const $userListItem = $("<li>");
      const $button = $("<button>").addClass("follow-toggle");
      new FollowToggle($button, {
        userId: user.id,
        followState: user.followed ? "followed" : "unfollowed"
      });
      const $userLink = $(`<a href='/users/${user.id}'></a>`);
      $userLink.text(user.username);
      $userListItem.append($userLink);
      $userListItem.append($button);
      this.ul.append($userListItem);
    });
  }
}

module.exports = UsersSearch;


/***/ }),
/* 3 */
/***/ (function(module, exports) {

const APIUtil = {
  followUser: id => {
    return $.ajax({
      url: `/users/${id}/follow`,
      method: "POST",
      dataType: "json",
    });
  },

  unfollowUser: id => {
    return $.ajax({
      url: `/users/${id}/follow`,
      method: "DELETE",
      dataType: "json",
    });
  },

  searchUsers: queryVal => {
    return $.ajax({
      url: '/users/search',
      dataType: "json",
      data: {query: queryVal}
    });
  }
};

module.exports = APIUtil;


/***/ })
/******/ ]);
//# sourceMappingURL=bundle.js.map