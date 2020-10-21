class CreateMemberGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :member_groups do |t|
      t.string :name
      t.references :company, index: true, foreign_key: true

      t.timestamps
    end
    add_reference :members, :member_group, index: true, foreign_key: true
  end
end
