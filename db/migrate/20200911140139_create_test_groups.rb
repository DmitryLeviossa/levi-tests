class CreateTestGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :test_groups do |t|
      t.string :name, null: false
      t.references :company, index: true, foreign_key: true

      t.timestamps
    end

    add_reference :tests, :test_group, index: true, foreign_key: true

    Company.find_each do |company|
      group = company.test_groups.create(name: 'Initial test group')
      company.tests.update_all(test_group_id: group.id)
    end
    change_column_null :tests, :test_group_id, false
  end
end
