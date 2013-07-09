App.SharedItemsController = Ember.ArrayController.extend
  select: (item) ->
    item.set("read_state", "read")
    item.save()

  filteredContent: (->
    filter = @get 'sourceFilter'
    if filter
      @get("content").filterProperty "source", filter
    else
      @get('content')
  ).property('content.@each.source', 'sourceFilter')

  applyFilter: (filter) ->
    @set('sourceFilter', filter)

  removeFilter: (filter) ->
    @set('sourceFilter', null)