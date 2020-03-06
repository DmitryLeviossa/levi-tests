class CreateTests < ActiveRecord::Migration[5.2]
  def change
    create_table :tests do |t|
      t.string :name
      t.references :company, index: true, foreign_key: true
      t.integer :questions_count
      t.integer :pass_count
      t.timestamps
    end
  end
end
