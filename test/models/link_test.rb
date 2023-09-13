# frozen_string_literal: true

# == Schema Information
#
# Table name: links
#
#  id         :bigint           not null, primary key
#  link_type  :string(1)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  project_id :bigint           not null
#  source_id  :bigint           not null
#  target_id  :bigint           not null
#
# Indexes
#
#  index_links_on_project_id  (project_id)
#  index_links_on_source_id   (source_id)
#  index_links_on_target_id   (target_id)
#
# Foreign Keys
#
#  fk_rails_...  (project_id => projects.id)
#  fk_rails_...  (source_id => tasks.id)
#  fk_rails_...  (target_id => tasks.id)
#
require 'test_helper'

class LinkTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
