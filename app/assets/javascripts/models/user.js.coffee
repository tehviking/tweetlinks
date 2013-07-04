App.User = Ember.Model.extend
  id: Ember.attr()
  name: Ember.attr()

App.User.url = "/api/users"
App.User.adapter = Ember.RESTAdapter.create()
