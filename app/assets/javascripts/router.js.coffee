App.Router.map ->
  @route 'landing', path: '/start'
  @resource 'sharedItems', path: '/'
  @route "fourOhFoured", path: "*:"

App.Router.reopen
  location: 'history'