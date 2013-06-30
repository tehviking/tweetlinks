class SharedItem < ActiveRecord::Base
  belongs_to :user
  validates_uniqueness_of :url, scope: :user_id

  def self.import_for_user(user)
    Twitter.favorites(user.uid.to_i).each do |tweet|
      next unless tweet.urls.present?
      tweet.urls.each do |url|
        item = user.shared_items.new
        item.tweet_uid = tweet.id
        item.tweet_body = tweet.text
        item.twitter_username = tweet.user.screen_name
        item.twitter_user_uid = tweet.user.id
        item.sharer_avatar_url = tweet.user.profile_image_url
        item.url = url.expanded_url
        item.display_url = url.display_url
        item.shared_at = tweet.created_at.to_datetime
        item.source = "favorites"
        item.save
      end
    end

    Twitter.user_timeline(user.uid.to_i).each do |tweet|
      next unless tweet.urls.present?
      tweet.urls.each do |url|
        item = user.shared_items.new
        item.tweet_uid = tweet.id
        item.tweet_body = tweet.text
        item.twitter_username = tweet.user.screen_name
        item.twitter_user_uid = tweet.user.id
        item.sharer_avatar_url = tweet.user.profile_image_url
        item.url = url.expanded_url
        item.display_url = url.display_url
        item.shared_at = tweet.created_at.to_datetime
        item.source = "timeline"
        item.save
      end
    end
  end
end

