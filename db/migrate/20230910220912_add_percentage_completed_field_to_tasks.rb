class AddPercentageCompletedFieldToTasks < ActiveRecord::Migration[7.0]
  def change
    add_column :tasks, :percentage_completed, :integer, null: false, default: 0
  end
end
