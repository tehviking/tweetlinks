#= require './keyboard_shortcut_route'
App.AuthenticatedRoute = Ember.Route.extend
  beforeModel: ->
    if !App.get('token').length
      @transitionTo('landing')
