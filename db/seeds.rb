# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create([
  { email: 'foo@example.com', password: 'foopassword' },
  { email: 'bar@example.com', password: 'barpassword' }
])

Link.create([
  { tweet_uid: "abcd1234", url: "http://example.com/abcd1234", tweet_body: Faker::Lorem.words(12), creator_username: "@fake1", creator_uid: "1234abcd" },
  { tweet_uid: "abcd5678", url: "http://example.com/abcd5678", tweet_body: Faker::Lorem.words(12), creator_username: "@fake2", creator_uid: "1234efgh" },
  { tweet_uid: "abcd9012", url: "http://example.com/abcd9012", tweet_body: Faker::Lorem.words(12), creator_username: "@fake3", creator_uid: "1234ijkl" }
])