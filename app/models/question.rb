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

  accepts_nested_attributes_for :answers, allow_destroy: true
  validates :text, presence: true
end
