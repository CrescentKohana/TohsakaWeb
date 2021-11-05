class RenameColumnTypeToCategoryInTrophies < ActiveRecord::Migration[6.1]
  def change
    rename_column :trophies, :type, :category
  end
end
