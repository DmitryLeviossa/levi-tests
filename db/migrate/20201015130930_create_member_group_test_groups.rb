class CreateMemberGroupTestGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :member_group_test_groups do |t|
      t.references :member_group, index: true, foreign_key: true
      t.references :test_group, index: true, foreign_key: true
      
      t.timestamps
    end
  end
end
