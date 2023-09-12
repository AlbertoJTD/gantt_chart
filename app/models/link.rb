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
#
class Link < ApplicationRecord
end
