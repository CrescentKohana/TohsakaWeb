class CreateLinkeds < ActiveRecord::Migration[6.1]
  def change
    create_table :linkeds do |t|
      t.text :type
      t.text :url
      t.datetime :timestamp
      t.text :file_hash
      t.bigint :author_id
      t.bigint :server_id
      t.bigint :channel_id
      t.bigint :msg_id

      t.timestamps
    end
  end
end
