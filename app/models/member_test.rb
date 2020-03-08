# == Schema Information
#
# Table name: member_tests
#
#  id         :bigint           not null, primary key
#  status     :string           default("started"), not null
#  member_id  :bigint
#  test_id    :bigint
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class MemberTest < ApplicationRecord
  belongs_to :member
  belongs_to :test

  has_many :member_test_questions

  enum status: { started: "started", passed: "passed", failed: "failed" }

  after_create :populate_member_test_questions

  private

  def populate_member_test_questions
    test.questions.order("RANDOM()").limit(test.questions_count).ids.each do |question_id|
      member_test_questions.create(question_id: question_id)
    end
  end
end
