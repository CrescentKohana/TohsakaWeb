class CreateIssuesAndTrophies < ActiveRecord::Migration[6.1]
  def change
    create_table :issues do |t|
      t.text :content, null: false
      t.integer :type, null: false, default: 0
      t.text :tags, null: true
      t.bigint :user_id, null: false

      t.timestamps
    end

    create_table :trophies do |t|
      t.text :reason, null: false
      t.integer :duration, null: false
      t.integer :type, null: false, default: 0
      t.bigint :discord_user_id, null: false
      t.bigint :server_id, null: false
      t.bigint :role_id, null: false

      t.timestamps
    end
  end
end
