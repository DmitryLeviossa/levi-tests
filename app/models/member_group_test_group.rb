# == Schema Information
#
# Table name: member_group_test_groups
#
#  id              :bigint           not null, primary key
#  member_group_id :bigint
#  test_group_id   :bigint
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class MemberGroupTestGroup < ApplicationRecord
  belongs_to :member_group
  belongs_to :test_group
end
