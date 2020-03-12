class MemberTestQuestionAnswer < ApplicationRecord
  belongs_to :answer
  belongs_to :member_test_question
end
