App.AuthenticatedRoute = Ember.Route.extend
  beforeModel: ->
    if !App.get('token').length
      @transitionTo('landing')
