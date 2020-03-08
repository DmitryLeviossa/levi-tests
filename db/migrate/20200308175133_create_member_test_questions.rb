class CreateMemberTestQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :member_test_questions do |t|
      t.references :question, index: true, foreign_key: true
      t.references :member_test, index: true, foreign_key: true
      t.references :answer, index: true, foreign_key: true
      t.timestamps
    end
  end
end
