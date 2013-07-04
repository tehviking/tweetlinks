App.Router.map ->
  @route 'landing', path: '/start'
  @resource 'sharedItems', path: '/', ->
    @resource 'sharedItem',  path: '/:shared_item_id'
  @route "fourOhFoured", path: "*:"

App.Router.reopen
  location: 'history'