class AddIndexes < ActiveRecord::Migration[6.0]
  def change
    add_index :users, :name

    add_index :authorizations, :uid
    add_index :authorizations, :user_id
  end
end
