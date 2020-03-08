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
  validates :name, :email, presence: true

end
