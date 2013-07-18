class CreateReadableItems < ActiveRecord::Migration
  def change
    create_table :readable_items do |t|
      t.integer :shared_item_id
      t.text :content
      t.string :domain
      t.string :title
      t.string :author
    end
  end
end
