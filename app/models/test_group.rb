# == Schema Information
#
# Table name: test_groups
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  company_id :bigint
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  position   :integer          default(0)
#
class TestGroup < ApplicationRecord
  belongs_to :company

  has_many :tests
  has_many :member_group_test_groups
  has_many :member_groups, through: :member_group_test_groups
  
  validates :name, uniqueness: { scope: :company_id, message: 'Duplicate test groups not allowed' }
end
