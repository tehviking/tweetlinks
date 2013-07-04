class SharedItemSerializer < ActiveModel::Serializer
  attributes :id,
             :user_id,
             :twitter_user_uid,
             :tweet_uid,
             :twitter_username,
             :url,
             :display_url,
             :tweet_body,
             :shared_at,
             :sharer_avatar_url,
             :title,
             :read_state,
             :source
end
