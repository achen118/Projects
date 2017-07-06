const APIUtil = require('./api_util.js');

class InfiniteTweets {
  constructor() {
    this.maxCreatedAt = null;
    this.$feed = $(".infinite-tweets");
    this.fetchTweets();
    $(".fetch-more").on("click", this.fetchTweets.bind(this));
  }

  fetchTweets(event) {
    APIUtil.getTweets(this.maxCreatedAt).then(tweets => this.insertTweets(tweets));
    return false;
  }

  insertTweets(tweets) {
    this.maxCreatedAt = tweets.slice(-1)[0].created_at;
    tweets.forEach(el => {
      const $tweet = $("<li>").text(JSON.stringify($(el)));
      this.$feed.append($tweet);
    });
    if (tweets.length < 20) {
      $(".fetch-more").remove();
      const $noMoreTweets = $("<strong>").text("No more tweets to fetch");
      this.$feed.append($noMoreTweets);
    }
  }
}

module.exports = InfiniteTweets;
