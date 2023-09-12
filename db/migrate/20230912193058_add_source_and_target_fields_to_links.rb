class AddSourceAndTargetFieldsToLinks < ActiveRecord::Migration[7.0]
  def change
    add_reference :links, :source, null: false, foreign_key: { to_table: :tasks }
    add_reference :links, :target, null: false, foreign_key: { to_table: :tasks }
  end
end
