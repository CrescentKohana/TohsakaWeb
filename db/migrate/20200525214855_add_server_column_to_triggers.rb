class AddServerColumnToTriggers < ActiveRecord::Migration[6.0]
  def change
    add_column :triggers, :server_id, :bigint, null: false, :after => :user_id
  end
end
