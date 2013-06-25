class Link < ActiveRecord::Base
  attr_accessible :creator_uid, :creator_username, :tweet_body, :tweet_uid, :url
end
