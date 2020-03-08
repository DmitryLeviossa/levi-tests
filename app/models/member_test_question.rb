class MemberTestQuestion < ApplicationRecord
  belongs_to :member_test
  belongs_to :question
  belongs_to :answer, optional: true
end
