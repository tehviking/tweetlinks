App.SharedItemRoute = App.AuthenticatedRoute.extend
  model: (params) ->
    App.SharedItem.find(params.shared_item_id)
  setupController: (controller, model) ->
    @controllerFor('sharedItems').set('currentlyReading', model)
    controller.set "content", model
    controller.set "readableItem", App.ReadableItem.find(model.get("id"))
