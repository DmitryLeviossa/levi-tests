# == Schema Information
#
# Table name: member_test_question_answers
#
#  id                      :bigint           not null, primary key
#  member_test_question_id :bigint
#  answer_id               :bigint
#  label                   :string
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#
class MemberTestQuestionAnswer < ApplicationRecord
  belongs_to :answer
  belongs_to :member_test_question
end
