class CreateAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
      t.text :text
      t.references :question, index: true, foreign_key: true
      t.boolean :is_right, default: false
      t.timestamps
    end
  end
end
