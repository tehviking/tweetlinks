App.SharedItemsController = Ember.ArrayController.extend
  select: (item) ->
    item.set("read_state", "read")
    @set('currentlyReading',item)
    item.save()
    @transitionToRoute("sharedItem", item)

  nextItem: ->
    item = @get('currentlyReading') or @get('filteredContent').objectAt(0)
    index = @get("filteredContent").indexOf(item)
    index = -1 unless index isnt @get("filteredContent").length
    @select @get("filteredContent").objectAt(index + 1)

  prevItem: ->
    item = @get('currentlyReading') or @get('filteredContent').objectAt(0)
    index = @get("filteredContent").indexOf(item)
    index = 1 unless index
    @select @get("filteredContent").objectAt(index - 1)

  sourceFilteredContent: (->
    filter = @get 'sourceFilter'
    if filter
      @get("content").filterProperty "source", filter
    else
      @get('content')
  ).property('content.@each.source', 'sourceFilter')

  filteredContent: (->
    filter = @get 'unreadFilter'
    if filter
      @get("sourceFilteredContent").filter (tweet) =>
        tweet is @get('currentlyReading') or tweet.get('read_state') is filter
    else
      @get('sourceFilteredContent')
  ).property('sourceFilteredContent.@each.read_state', 'unreadFilter', 'currentlyReading')

  unreadContent: (->
    @get("sourceFilteredContent").filterProperty "read_state", "unread"
  ).property('sourceFilteredContent.@each.read_state', 'unreadFilter')

  readContent: (->
    @get("sourceFilteredContent").filterProperty "read_state", "read"
  ).property('sourceFilteredContent.@each.read_state', 'unreadFilter')

  applyFilter: (filter) ->
    @set('sourceFilter', filter)

  applyUnreadFilter: (filter) ->
    @set('unreadFilter', filter)

  removeFilters: ->
    @set('sourceFilter', null)
    @set('unreadFilter', null)
