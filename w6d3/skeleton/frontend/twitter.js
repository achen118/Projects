const FollowToggle = require('./follow_toggle.js');
const UsersSearch = require('./users_search.js');
const TweetCompose = require('./tweet_compose.js');

$(() => {
  $('.follow-toggle').each((idx, el) => {
    new FollowToggle(el, {});
  });
  $('.users-search').each((idx, el) => {
    new UsersSearch(el);
  });
  $('.tweet-compose').each((idx, el) => {
    new TweetCompose(el);
  });
});