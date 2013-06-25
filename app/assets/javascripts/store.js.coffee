Tweetlinks.Store = DS.Store.extend
  adapter: DS.RESTAdapter.create
    url: '/api'