App.ApplicationView = Ember.View.extend
  keyPress: (e) ->
    console.log e
    console.log 'keypress'

  click: (e) ->
    console.log e
    console.log 'clicky'