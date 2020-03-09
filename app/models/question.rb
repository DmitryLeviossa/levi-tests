# == Schema Information
#
# Table name: questions
#
#  id         :bigint           not null, primary key
#  text       :text
#  test_id    :bigint
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Question < ApplicationRecord
  belongs_to :test

  has_many :answers, dependent: :destroy
  has_many :member_test_questions, dependent: :destroy

  accepts_nested_attributes_for :answers, allow_destroy: true

  validates :text, presence: true

  validate :answer_is_rigth

  def right_answer
    answers.find_by(is_right: true)
  end

  private

  def answer_is_rigth
    errors[:base] << "One answers should be right" unless answers.count { |x| x.is_right? } == 1
  end
end
