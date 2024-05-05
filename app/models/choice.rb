class Choice < ApplicationRecord
  validates :answer, presence: true
  validates :correct_answer, presence: true
  belongs_to :question
end
