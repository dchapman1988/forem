class CreateForemPosts < ActiveRecord::Migration
  def self.up
    create_table :forem_posts do |t|
      t.integer :topic_id
      t.text :text
      t.integer :user_id

      t.timestamps
    end
  end
end