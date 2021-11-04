class EditTrophiesColumns < ActiveRecord::Migration[6.1]
  def change
    rename_column :trophies, :discord_user_id, :discord_uid
  end
end
