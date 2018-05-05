class AddFieldsToResult < ActiveRecord::Migration[5.1]
  def change
    add_reference :results, :user, foreign_key: true
    add_reference :results, :survey, foreign_key: true
    add_reference :results, :girl, foreign_key: { to_table: :users }
    add_column :results, :rating, :float, :default => 0.0
  end
end
