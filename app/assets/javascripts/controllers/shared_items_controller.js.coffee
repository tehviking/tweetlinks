App.SharedItemsController = Ember.ArrayController.extend
  select: (item) ->
    item.set("read_state", "read")
    item.save()
