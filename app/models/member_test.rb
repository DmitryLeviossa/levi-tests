# == Schema Information
#
# Table name: member_tests
#
#  id         :bigint           not null, primary key
#  status     :string           default("draft"), not null
#  member_id  :bigint
#  test_id    :bigint
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class MemberTest < ApplicationRecord
  belongs_to :member
  belongs_to :test

  has_many :member_test_questions, dependent: :destroy
  has_many :attempts, dependent: :destroy

  enum status: { draft: "draft", started: "started", passed: "passed", failed: "failed" }

  validates :test_id, uniqueness: { scope: :member_id }
  
  after_create :populate_member_test_questions
  before_update :check_results

  accepts_nested_attributes_for :member_test_questions, allow_destroy: true
  
  def get_temp_token
    payload = { id: self.id }
    payload[:exp] = 20.minutes.from_now.to_i
    JWT.encode(payload, Rails.configuration.JWT_SECRET)
  end

  def regerenate!
    member_test_questions.destroy_all
    update_column(:status, :draft)
    populate_member_test_questions
  end

  def is_question_right question
    return question.answer_id? ? question.answer_id == question.question.right_answer&.id : false
  end

  def count_rights
    right_count = 0
    member_test_questions.each do |question|
      right_count += 1 if is_question_right question
    end 
    return right_count
  end

  private

  def check_results
    if self.status_was === 'started'
      right_count = count_rights
      self.status = right_count >= test.pass_count ? :passed : :failed
    end
  end

  def populate_member_test_questions
    test.questions.order("RANDOM()").limit(test.questions_count).each do |question|
      mtq = member_test_questions.create!(question_id: question.id)
      question.answers.order('Random()').pluck(:id).each_with_index do |x, i| 
        mtq.member_test_question_answers.create!(answer_id: x, label: ('A'..'Z').to_a[i])
      end
    end
  end
end
