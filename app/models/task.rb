# frozen_string_literal: true

# == Schema Information
#
# Table name: tasks
#
#  id                   :bigint           not null, primary key
#  completed            :boolean          default(FALSE)
#  description          :text
#  end_date             :datetime         not null
#  name                 :string           not null
#  percentage_completed :integer          default(0), not null
#  start_date           :datetime         not null
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  parent_id            :bigint
#  project_id           :bigint           not null
#
# Indexes
#
#  index_tasks_on_parent_id   (parent_id)
#  index_tasks_on_project_id  (project_id)
#
# Foreign Keys
#
#  fk_rails_...  (parent_id => tasks.id)
#  fk_rails_...  (project_id => projects.id)
#
class Task < ApplicationRecord
  belongs_to :project

  has_many :task_dependency

  # Relation between task and itself
  # belongs_to :parent, class_name: "Task", optional: true
  # has_many :subtasks, class_name: "Task", foreign_key: "parent_id"

  validates :name, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
end
