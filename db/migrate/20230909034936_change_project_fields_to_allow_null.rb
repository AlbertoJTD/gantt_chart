# frozen_string_literal: true

class ChangeProjectFieldsToAllowNull < ActiveRecord::Migration[7.0]
  def change
    change_column_null :projects, :end_date, true
    change_column_null :projects, :name, true
    change_column_null :projects, :start_date, true
  end
end
