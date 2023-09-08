# == Schema Information
#
# Table name: task_dependencies
#
#  id                 :bigint           not null, primary key
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  depends_on_task_id :bigint           not null
#  task_id            :bigint           not null
#
# Indexes
#
#  index_task_dependencies_on_depends_on_task_id              (depends_on_task_id)
#  index_task_dependencies_on_task_id                         (task_id)
#  index_task_dependencies_on_task_id_and_depends_on_task_id  (task_id,depends_on_task_id) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (depends_on_task_id => tasks.id)
#  fk_rails_...  (task_id => tasks.id)
#
class TaskDependency < ApplicationRecord
  belongs_to :task
  belongs_to :depends_on_task, class_name: 'Task', foreign_key: 'depends_on_task_id'
end
