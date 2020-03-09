class MemberTestQuestion < ApplicationRecord
  belongs_to :member_test
  belongs_to :question
  belongs_to :answer, optional: true

  validates :member_test_id, uniqueness: { scope: :question_id }

end
