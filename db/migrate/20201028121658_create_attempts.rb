class CreateAttempts < ActiveRecord::Migration[5.2]
  def change
    create_table :attempts do |t|
      t.integer :result, null: false
      t.string :status
      t.references :member_test, index: true, foreign_key: true
      t.timestamps
    end
  end
end
