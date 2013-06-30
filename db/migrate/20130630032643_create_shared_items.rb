class CreateSharedItems < ActiveRecord::Migration
  def change
    create_table :shared_items do |t|
      t.integer :user_id
      t.string :twitter_user_uid
      t.string :tweet_uid
      t.string :twitter_username
      t.string :url
      t.string :tweet_body
      t.datetime :shared_at
      t.string :sharer_avatar_url
      t.string :title

      t.timestamps
    end
  end
end
