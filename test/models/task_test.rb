# frozen_string_literal: true

# == Schema Information
#
# Table name: tasks
#
#  id                   :bigint           not null, primary key
#  completed            :boolean          default(FALSE)
#  description          :text
#  duration             :integer          not null
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
require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
