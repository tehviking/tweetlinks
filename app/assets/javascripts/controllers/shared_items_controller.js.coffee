App.SharedItemsController = Ember.ArrayController.extend
  select: (item) ->
    item.set("read_state", "read")
    item.save()
  filteredContent: (->
    @get('content')
  ).property('content.@each.source')

  applyFilter: (filter) ->
    @set('filteredContent', @get('content').filterProperty('source', filter))

  removeFilter: (filter) ->
    @set('filteredContent', @get('content'))