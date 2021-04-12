class RenameColumnName < ActiveRecord::Migration[6.1]
  def change
    rename_column :linkeds, :type, :category
  end
end
