class AddTwitterTokenToUser < ActiveRecord::Migration
  def change
    add_column :users, :twitter_token, :string
  end
end
