class AdjustHighlight < ActiveRecord::Migration[6.1]
  def change
    add_column :highlights, :highlight_msg_id, :bigint, null: false
    rename_column :highlights, :server_id, :server
    rename_column :highlights, :channel_id, :channel
    rename_column :highlights, :message_id, :msg_id
    rename_column :highlights, :message, :content
    rename_column :highlights, :user_id, :author_id
  end
end
