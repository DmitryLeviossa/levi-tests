class CreateMemberTests < ActiveRecord::Migration[5.2]
  def change
    create_table :member_tests do |t|
      t.string :status, null: false, default: :started
      t.references :member, index: true, foreign_key: true
      t.references :test, index: true, foreign_key: true
      t.timestamps
    end
  end
end
