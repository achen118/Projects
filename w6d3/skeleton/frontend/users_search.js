const APIUtil = require('./api_util.js');
const FollowToggle = require('./follow_toggle.js');

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
