class ChangeColumnOrder < ActiveRecord::Migration[6.1]
  def change
    change_column :trophies, :expired, :boolean, after: :role_id, default: false, null: false
    change_column :issues, :server_id, :bigint, after: :user_id, null: false
    change_column :highlights, :highlight_msg_id, :bigint, after: :server_id, null: false
    change_column :highlights, :deleted, :boolean, after: :timestamp, null: false
  end
end
