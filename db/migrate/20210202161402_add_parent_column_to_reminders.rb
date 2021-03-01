class AddParentColumnToReminders < ActiveRecord::Migration[6.1]
  def change
    add_column :reminders, :parent, :bigint, null: true, :after => :repeat
  end
end
