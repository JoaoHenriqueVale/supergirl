class AddStatusToSurvey < ActiveRecord::Migration[5.1]
  def change
    add_column :surveys, :status, :boolean, :default => true
  end
end
