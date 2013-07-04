App.SharedItemsRoute = App.AuthenticatedRoute.extend
  model: ->
    App.SharedItem.find()