class AddPermissionsColumnToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :permissions, :integer, null: true, :after => :locale
  end
end
