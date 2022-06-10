# == Schema Information
#
# Table name: members
#
#  id              :bigint           not null, primary key
#  name            :string
#  email           :string
#  company_id      :bigint
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  member_group_id :bigint
#  token           :string
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

  def matrix
    matrix = {}
    member_group.test_groups.order(:position).find_each do |test_group|
      matrix[test_group.name] = test_group.tests.order(:module).map do |test|
        member_test = member_tests.find_by(test: test)
        is_active = member_test.present? && !member_test.passed?
        is_passed = !!member_test&.passed? || false
        {
          id: test.id,
          name: test.name,
          questions_count: test.questions_count,
          pass_count: test.pass_count,
          value: test.value,
          module: test.module,
          description: test.description,
          is_passed: is_passed,
          is_active: is_active
        }
      end
    end

    matrix
  end
end
