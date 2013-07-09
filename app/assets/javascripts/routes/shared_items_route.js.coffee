App.SharedItemsRoute = App.AuthenticatedRoute.extend
  model: ->
    App.SharedItem.find()
  setupController: (controller, model) ->
    controller.set('content', model)