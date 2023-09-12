# frozen_string_literal: true

# == Schema Information
#
# Table name: projects
#
#  id         :bigint           not null, primary key
#  end_date   :datetime
#  name       :string
#  start_date :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Project < ApplicationRecord
  has_one_attached :file

  has_many :tasks, dependent: :destroy
  has_many :links, dependent: :destroy

  validates :name, presence: true
end
