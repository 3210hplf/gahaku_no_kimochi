class Question < ApplicationRecord
  # questionモデルに対して、image, author, ageの入力が必須
  validates :image, presence: true
  validates :author, presence: true
  validates :age, presence: true
  # questionモデルに対して、choicesモデルと1対多の関係を記述
  has_many :choices, dependent: :destroy
  # 画像をアップロードするための記述
  mount_uploader :image, ImageUploader
  # フォームにおいてchoiceモデルの入力を許可するために記述
  # allow_destroy: true　＝　QuestionモデルからChoiceモデルへの削除ができるように
  accepts_nested_attributes_for :choices, allow_destroy: true
end
