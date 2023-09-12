class AddDurationFieldToTasks < ActiveRecord::Migration[7.0]
  def change
    add_column :tasks, :duration, :integer, null: false
  end
end
