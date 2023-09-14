# frozen_string_literal: true

class CreateLinks < ActiveRecord::Migration[7.0]
  def change
    create_table :links do |t|
      t.references :source_task, foreign_key: { to_table: :tasks }
      t.references :target_task, foreign_key: { to_table: :tasks }
      t.string :link_type, limit: 1

      t.timestamps
    end
  end
end
