class CreateMemberTestGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :member_test_groups do |t|
      t.references :member, index: true, foreign_key: true
      t.references :test_group, index: true, foreign_key: true

      t.timestamps
    end
    add_reference :members, :member_test_group, index: true, foreign_key: true
    add_reference :test_groups, :member_test_group, index: true, foreign_key: true
  end
end
