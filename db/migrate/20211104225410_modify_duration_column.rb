class ModifyDurationColumn < ActiveRecord::Migration[6.1]
  def change
    change_column :trophies, :duration, :integer, null: true
  end
end
