class CreateBans < ActiveRecord::Migration
  def change
    create_table :bans do |t|
      t.integer :user_id
      t.integer :banned_by_user
      t.string :reason
      t.datetime :banned_until
    end
  end
end
