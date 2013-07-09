Ember.Handlebars.registerBoundHelper 'date', (date) ->
  moment(date).format('dddd, MMMM Do YYYY, h:mm a');