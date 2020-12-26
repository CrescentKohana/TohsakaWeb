class CreateHighlights < ActiveRecord::Migration[6.1]
  def change
    create_table :highlights do |t|
      t.text :message, null: true
      t.text :attachments, null: true
      t.bigint :user_id, null: false
      t.datetime :timestamp, null: false
      t.bigint :message_id, null: false
      t.bigint :channel_id, null: false
      t.bigint :server_id, null: false

      t.timestamps
    end
  end
end
