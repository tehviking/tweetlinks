App.SharedItemController = Ember.ObjectController.extend
  markUnread: (item) ->
    item.set("read_state", "unread")
    item.save()
