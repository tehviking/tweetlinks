J_KEY = 106
K_KEY = 107

App.SharedItemsRoute = App.AuthenticatedRoute.extend
  model: ->
    App.SharedItem.find()
  setupController: (controller, model) ->
    controller.set('content', model)
