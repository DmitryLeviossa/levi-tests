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

  enum status: { started: "started", passed: "passed", failed: "failed" }
end
