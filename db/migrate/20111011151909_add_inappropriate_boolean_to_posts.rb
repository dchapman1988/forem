class AddInappropriateBooleanToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :inappropriate, :boolean, :default => false
  end
end
