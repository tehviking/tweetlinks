J_KEY = 106
K_KEY = 107

App.SharedItemRoute = App.AuthenticatedRoute.extend
  model: (params) ->
    App.SharedItem.find(params.shared_item_id)
  setupController: (controller, model) ->
    @controllerFor('sharedItems').set('currentlyReading', model)
    controller.set "content", model
    controller.set "readableItem", App.ReadableItem.find(model.get("id"))
  init: ->
    $ = Ember.$
    $(document).keypress (event) =>
      pressed = event.which
      return unless pressed is J_KEY or pressed is K_KEY
      con = @controllerFor('sharedItems')
      if pressed is J_KEY
        con.nextItem()
      else
        con.prevItem()
    this._super()
  destroy: ->
    $(document).unbind('keypress')
    this._super()
