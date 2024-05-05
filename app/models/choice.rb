class Choice < ApplicationRecord
  validates :answer, presence: true
  validates :correct_answer, presence: false
  belongs_to :question
end
