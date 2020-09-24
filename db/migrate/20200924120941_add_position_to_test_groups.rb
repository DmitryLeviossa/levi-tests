class AddPositionToTestGroups < ActiveRecord::Migration[5.2]
  def change
    add_column :test_groups, :position, :integer, default: 0, index: true
  end
end
