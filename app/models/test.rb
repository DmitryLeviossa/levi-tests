# == Schema Information
#
# Table name: tests
#
#  id              :bigint           not null, primary key
#  name            :string
#  company_id      :bigint
#  questions_count :integer
#  pass_count      :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class Test < ApplicationRecord
  has_many :questions, dependent: :destroy

  validates :name, :questions_count, :pass_count, presence: true
  validates :name, uniqueness: { scope: :company_id }

end
