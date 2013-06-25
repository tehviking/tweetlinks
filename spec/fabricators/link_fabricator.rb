Fabricator(:link) do
  tweet_uid { sequence(:tweet_uid) { |i| "tweet_uid#{i}"} }
  url { Faker::Internet.domain_name }
  tweet_body { Faker::Lorem.words(12) }
  creator_username { "@" + Faker::Internet.user_name }
  creator_uid { sequence(:creator_uid) { |i| "creator_uid#{i}"} }
end