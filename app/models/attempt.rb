# == Schema Information
#
# Table name: attempts
#
#  id             :bigint           not null, primary key
#  result         :integer          not null
#  status         :string
#  member_test_id :bigint
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
class Attempt < ApplicationRecord
  belongs_to :member_test
end
