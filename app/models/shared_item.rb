class SharedItem < ActiveRecord::Base
  belongs_to :user
  validates_uniqueness_of :url, scope: :user_id

  default_scope {order("shared_at DESC")}

  SOURCE_TYPES = %w(favorites user_timeline mentions_timeline home_timeline)
  PUBLIC_SOURCE_TYPES = %w(favorites user_timeline)

  def self.import_for_user(user)
    client = Twitter::Client.new(
      oauth_token: user.twitter_token,
      oauth_token_secret: user.twitter_secret
    )
    SOURCE_TYPES.each do |source_type|
      if PUBLIC_SOURCE_TYPES.include?(source_type)
        Twitter.send(source_type.to_sym, user.uid.to_i, {count: 50}).each do |tweet|
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
            item.source = source_type
            item.save
          end
        end
      else
        client.send(source_type.to_sym, {count: 50}).each do |tweet|
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
            item.source = source_type
            item.save
          end
        end
      end
    end
  end
end

