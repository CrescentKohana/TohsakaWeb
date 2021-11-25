class AddBirthdayColumnToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :birthday, :timestamp, null: true, after: :locale
  end
end
