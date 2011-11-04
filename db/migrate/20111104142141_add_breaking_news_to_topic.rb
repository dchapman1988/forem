class AddBreakingNewsToTopic < ActiveRecord::Migration
  def change
    add_column :topics, :breaking_news, :boolean, :default => false
  end
end
