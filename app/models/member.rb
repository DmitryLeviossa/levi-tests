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
  belongs_to :company

  has_many :member_tests, dependent: :destroy
  has_many :member_test_groups, dependent: :destroy
  has_many :test_groups, through: :member_test_groups
  has_many :tests, through: :test_groups

  validates :name, :email, presence: true
  validates :name, uniqueness: { scope: :company_id }

  def matrix_token
    payload = { member_id: id, company_id: company_id }
    JWT.encode payload, nil, 'none'
  end
end
