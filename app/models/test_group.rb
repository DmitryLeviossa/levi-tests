class TestGroup < ApplicationRecord
  belongs_to :company

  has_many :tests
  has_many :member_group_test_groups
  has_many :member_groups, through: :member_group_test_groups
  
  validates :name, uniqueness: { scope: :company_id, message: 'Duplicate test groups not allowed' }
end