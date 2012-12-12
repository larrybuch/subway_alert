# == Schema Information
#
# Table name: lines
#
#  id         :integer          not null, primary key
#  line       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Line < ActiveRecord::Base
  has_and_belongs_to_many :users
  has_many :statuses
end