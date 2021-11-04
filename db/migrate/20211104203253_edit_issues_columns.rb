class EditIssuesColumns < ActiveRecord::Migration[6.1]
  def change
    rename_column :issues, :tags, :status
  end
end
