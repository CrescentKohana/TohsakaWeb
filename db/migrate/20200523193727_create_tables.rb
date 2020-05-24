class CreateTables < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.integer :discriminator, null: true
      t.string :avatar, null: true
      t.string :locale, null: true

      t.timestamps
    end

    create_table :authorizations do |t|
      t.string :provider, null: false
      t.bigint :uid, null: false
      t.bigint :user_id, null: false

      t.timestamps
    end

    create_table :reminders do |t|
      t.datetime :datetime, null: false
      t.text :message, null: true
      t.bigint :user_id, null: false
      t.bigint :channel, null: true
      t.bigint :repeat, default: 0

      t.timestamps
    end

    create_table :triggers do |t|
      t.text :phrase, null: false
      t.text :reply, null: true
      t.text :file, null: true
      t.bigint :user_id, null: false
      t.integer :chance, default: 0
      t.integer :mode, default: 0

      t.timestamps
    end
  end
end
