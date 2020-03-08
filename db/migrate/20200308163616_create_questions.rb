class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.text :text
      t.references :test, index: true, foreign_key: true
      t.timestamps
    end
  end
end
