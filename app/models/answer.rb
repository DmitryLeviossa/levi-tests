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

  validates :text, presence: true

end
