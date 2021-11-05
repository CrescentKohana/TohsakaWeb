class ModifyDurationColumnNullFalse < ActiveRecord::Migration[6.1]
  def change
    change_column :trophies, :duration, :integer, null: false
  end
end
