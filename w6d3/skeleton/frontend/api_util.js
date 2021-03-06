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
  },

  createTweet: data => {
    return $.ajax({
      url: '/tweets',
      method: "POST",
      dataType: "json",
      data: data
    });
  },

  getTweets: (maxCreatedAt) => {
    return $.ajax({
      url: '/feed',
      dataType: 'json',
      data: maxCreatedAt ? { max_created_at: maxCreatedAt } : {}
    });
  }
};

module.exports = APIUtil;
