class ModifyStatusColumn < ActiveRecord::Migration[6.1]
  def change
    change_column :issues, :status, :text, default: 'new', null: false
  end
end
