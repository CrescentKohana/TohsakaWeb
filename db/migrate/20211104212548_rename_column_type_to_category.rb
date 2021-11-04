class RenameColumnTypeToCategory < ActiveRecord::Migration[6.1]
  def change
    rename_column :issues, :type, :category
  end
end
