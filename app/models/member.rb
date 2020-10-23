# == Schema Information
#
# Table name: members
#
#  id         :bigint           not null, primary key
#  name       :string
#  email      :string
#  company_id :bigint
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Member < ApplicationRecord
  has_secure_token
  belongs_to :company
  belongs_to :member_group
  
  has_many :member_tests, dependent: :destroy
  has_many :test_groups, through: :member_group
  has_many :tests, through: :test_groups

  validates :name, :email, presence: true
  validates :name, uniqueness: { scope: :company_id }
end
