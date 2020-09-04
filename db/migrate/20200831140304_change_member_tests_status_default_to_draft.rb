class ChangeMemberTestsStatusDefaultToDraft < ActiveRecord::Migration[5.2]
  def change
    change_column_default :member_tests, :status, from: :started, to: :draft
  end
end
