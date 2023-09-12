class ChangeLinkColumnsToReferences < ActiveRecord::Migration[7.0]
  def change
    change_table :links do |t|
      t.remove :source, :integer
      t.remove :target, :integer
      t.references :source_task, foreign_key: { to_table: :tasks }
      t.references :target_task, foreign_key: { to_table: :tasks }
    end
  end
end
