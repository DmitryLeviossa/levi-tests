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

  has_many :member_test_questions, dependent: :destroy

  enum status: { started: "started", passed: "passed", failed: "failed" }

  validates :test_id, uniqueness: { scope: :member_id }

  after_create :populate_member_test_questions
  before_update :check_results

  accepts_nested_attributes_for :member_test_questions, allow_destroy: true

  def regerenate!
    member_test_questions.destroy_all
    update_column(:status, :started)
    populate_member_test_questions
  end

  private

  def populate_member_test_questions
    test.questions.order("RANDOM()").limit(test.questions_count).ids.each do |question_id|
      member_test_questions.create(question_id: question_id)
    end
  end

  def check_results
    right_count = 0
    member_test_questions.each do |question|
      if question.answer_id?
        right_count += 1 if question.answer_id == question.question.right_answer&.id
      end
    end 
    self.status = right_count >= test.pass_count ? :passed : :failed
  end
end
