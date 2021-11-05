class AddExpiredColumnToTrophies < ActiveRecord::Migration[6.1]
  def change
    add_column :trophies, :expired, :boolean, default: false, null: false
  end
end
