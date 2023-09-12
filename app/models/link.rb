# == Schema Information
#
# Table name: links
#
#  id         :bigint           not null, primary key
#  link_type  :string(1)
#  source     :integer
#  target     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  project_id :bigint           not null
#
# Indexes
#
#  index_links_on_project_id  (project_id)
#
# Foreign Keys
#
#  fk_rails_...  (project_id => projects.id)
#
class Link < ApplicationRecord
  belongs_to :project
end
