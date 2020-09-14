class TestGroup < ApplicationRecord
  belongs_to :company
  has_many :tests
end