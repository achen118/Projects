const APIUtil = require('./api_util.js');

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
