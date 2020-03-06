class MemberTest < ApplicationRecord
  belongs_to :member
  belongs_to :test

  enum status: { started: "started", passed: "passed", failed: "failed" }
end
