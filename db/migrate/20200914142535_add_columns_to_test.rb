class AddColumnsToTest < ActiveRecord::Migration[5.2]
  def change
    add_column :tests, :value, :integer, default: 0
    add_column :tests, :module, :integer, default: 1
    add_column :tests, :description, :text

    Test.find_each do |test|
      company = test.company
      test_group = TestGroup.create!(name: test.name, company: company)
      test.update(test_group: test_group)
    end

    add_index :test_groups, %i[name company_id], unique: true
    add_index :tests, %i[module test_group_id], unique: true
  end
end
