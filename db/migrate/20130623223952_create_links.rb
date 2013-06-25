class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :tweet_uid
      t.string :url
      t.string :tweet_body
      t.string :creator_username
      t.string :creator_uid

      t.timestamps
    end
  end
end
