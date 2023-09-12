class CreateLinks < ActiveRecord::Migration[7.0]
  def change
    create_table :links do |t|
      t.integer :source
      t.integer :target
      t.string :link_type, limit: 1

      t.timestamps
    end
  end
end
