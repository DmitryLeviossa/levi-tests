# == Schema Information
#
# Table name: member_groups
#
#  id         :bigint           not null, primary key
#  name       :string
#  company_id :bigint
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class MemberGroup < ApplicationRecord
  belongs_to :company
  
  has_many :members, dependent: :nullify
  has_many :member_group_test_groups, dependent: :destroy
  has_many :test_groups, through: :member_group_test_groups
  has_many :tests, through: :test_groups

  validates :name, uniqueness: { scope: :company_id, message: 'Duplicate member groups not allowed' }
end
