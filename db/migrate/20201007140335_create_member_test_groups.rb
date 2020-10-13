class CreateMemberTestGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :member_test_groups do |t|
      t.references :member, index: true, foreign_key: true
      t.references :test_group, index: true, foreign_key: true

      t.timestamps
    end
  end
end
