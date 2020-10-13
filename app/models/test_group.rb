class TestGroup < ApplicationRecord
  belongs_to :company
  has_many :tests

  validates :name, uniqueness: { scope: :company_id, message: 'Duplicate test groups not allowed' }
end