# == Schema Information
#
# Table name: answers
#
#  id          :bigint           not null, primary key
#  text        :text
#  question_id :bigint
#  is_right    :boolean          default("false")
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Answer < ApplicationRecord
  belongs_to :question
  
  has_many :member_test_questions, dependent: :destroy

  validates :text, presence: true
  scope :is_right, -> { where(is_right: true) }

end
