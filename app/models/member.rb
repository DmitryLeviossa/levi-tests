class Member < ApplicationRecord
  belongs_to :company

  has_many :member_tests
end
