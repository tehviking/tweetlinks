# http://emberjs.com/guides/models/defining-a-store/

Tweetlinks.Store = DS.Store.extend
  revision: 11
  adapter: DS.RESTAdapter.create()

