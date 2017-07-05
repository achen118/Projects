const FollowToggle = require('./follow_toggle.js');
const UsersSearch = require('./users_search.js');

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
