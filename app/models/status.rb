# == Schema Information
#
# Table name: statuses
#
#  id         :integer          not null, primary key
#  line_id    :integer
#  status     :string(255)
#  info       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Status < ActiveRecord::Base
  belongs_to :line
end