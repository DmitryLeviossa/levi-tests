# == Schema Information
#
# Table name: tests
#
#  id              :bigint           not null, primary key
#  name            :string
#  company_id      :bigint
#  questions_count :integer
#  pass_count      :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class Test < ApplicationRecord
  has_many :questions, dependent: :destroy
  has_many :member_tests, dependent: :destroy

  validates :name, :questions_count, :pass_count, presence: true
  validates :name, uniqueness: { scope: :company_id }
  validate :counters

  private

  def counters
    errors.add(:pass_count, "can't be greater than questions count") if pass_count > questions_count
  end
end
