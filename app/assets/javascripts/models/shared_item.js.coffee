App.SharedItem = Ember.Model.extend
  id: Ember.attr()
  user_id: Ember.attr()
  twitter_user_id: Ember.attr()
  tweet_uid: Ember.attr()
  twitter_username: Ember.attr()
  url: Ember.attr()
  display_url: Ember.attr()
  tweet_body: Ember.attr()
  shared_at: Ember.attr()
  sharer_avatar_url: Ember.attr()
  title: Ember.attr()
  read_state: Ember.attr()
  source: Ember.attr()

App.SharedItem.url = "/api/shared_items"
App.SharedItem.adapter = Ember.RESTAdapter.create()
