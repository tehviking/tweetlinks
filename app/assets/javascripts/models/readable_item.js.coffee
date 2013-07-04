App.ReadableItem = Ember.Model.extend
  id: Ember.attr()
  content: Ember.attr()
  author: Ember.attr()
  domain: Ember.attr()
  url: Ember.attr()
  title: Ember.attr()
App.ReadableItem.url = "/api/readable_items"
App.ReadableItem.adapter = Ember.RESTAdapter.create()
