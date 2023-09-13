# frozen_string_literal: true

class Rails < ActiveRecord::Migration[7.0]
  def change
    remove_column :links, :source_task_id, :bigint
    remove_column :links, :target_task_id, :bigint
  end
end
