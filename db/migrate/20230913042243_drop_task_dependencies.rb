# frozen_string_literal: true

class DropTaskDependencies < ActiveRecord::Migration[7.0]
  def up
    drop_table :task_dependencies
  end

  def down
    create_table :task_dependencies do |t|
      t.references :task, null: false, foreign_key: true
      t.references :depends_on_task, null: false, foreign_key: { to_table: :tasks }

      t.timestamps
    end

    add_index :task_dependencies, %i[task_id depends_on_task_id], unique: true
  end
end
