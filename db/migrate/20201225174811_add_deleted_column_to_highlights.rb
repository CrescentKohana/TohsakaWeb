class AddDeletedColumnToHighlights < ActiveRecord::Migration[6.1]
  def change
    add_column :highlights, :deleted, :boolean, null: false
  end
end
