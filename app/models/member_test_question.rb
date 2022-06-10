# == Schema Information
#
# Table name: member_test_questions
#
#  id             :bigint           not null, primary key
#  question_id    :bigint
#  member_test_id :bigint
#  answer_id      :bigint
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
class MemberTestQuestion < ApplicationRecord
  belongs_to :member_test
  belongs_to :question
  belongs_to :answer, optional: true

  has_many :member_test_question_answers, dependent: :destroy

  validates :member_test_id, uniqueness: { scope: :question_id }

  def answer_class_name(current_answer)
    return '' unless answer_id?
    
    if answer_id == current_answer.id
      question.right_answer.id == answer_id ? 'right' : 'not-right'
    else
      question.right_answer.id == current_answer.id ? 'right' : ''
    end
  end
end
