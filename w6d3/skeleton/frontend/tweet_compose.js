const APIUtil = require('./api_util.js');

class TweetCompose {
  constructor() {
    this.$form = $(".tweet-compose");
    this.$content = this.$form.find("textarea");
    this.$mention = this.$form.find("option");
    this.$charsLeft = this.$form.find(".chars-left");
    this.$charsLeft.text("140");
    this.$content.on("input", () => {
      $(".chars-left").text(140 - this.$content.val().length);
    });
    this.$form.on("submit", this.submit.bind(this));
  }

  submit(event) {
    event.preventDefault();
    const $formData = this.$form.serializeJSON();
    $(":input").attr("disabled", true);
    APIUtil.createTweet($formData).then(tweet => this.handleSuccess(tweet));
  }

  clearInput() {
    this.$content.val("");
    this.$mention.val("");
  }

  handleSuccess(tweet) {
    this.clearInput();
    $(":input").attr("disabled", false);
    const $feed = $(this.$form.data("tweets-ul"));
    tweet = JSON.stringify(tweet);
    const $tweet = $("<li>").text(tweet);
    $feed.append($tweet);
  }
}

module.exports = TweetCompose;
