App.SharedItem = Ember.Model.extend
  id: Ember.attr()
  userId: Ember.attr()
  twitter_userUid: Ember.attr()
  tweetUid: Ember.attr()
  twitterUsername: Ember.attr()
  url: Ember.attr()
  displayUrl: Ember.attr()
  tweetBody: Ember.attr()
  sharedAt: Ember.attr()
  sharerAvatarUrl: Ember.attr()
  title: Ember.attr()
  readState: Ember.attr()
  source: Ember.attr()

App.SharedItem.url = "/api/shared_items"
App.SharedItem.adapter = Ember.RESTAdapter.create()
