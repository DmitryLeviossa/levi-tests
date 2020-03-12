class CreateMemberTestQuestionAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :member_test_question_answers do |t|
      t.references :member_test_question, index: true, foreign_key: true
      t.references :answer, index: true, foreign_key: true
      t.string :label
      t.timestamps
    end
  end
end
