class FixTypoInColumnName < ActiveRecord::Migration[6.1]
  def change
    rename_column :triggers, :occurences, :occurrences
  end
end

