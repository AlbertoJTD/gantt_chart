class AddProjectReferenceToLinks < ActiveRecord::Migration[7.0]
  def change
    add_reference :links, :project, null: false, foreign_key: true
  end
end
