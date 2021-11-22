class AddServerIdToIssues < ActiveRecord::Migration[6.1]
  def change
    add_column :issues, :server_id, :bigint, null: false
  end
end
