class ShiritoriGame < ApplicationRecord
  # drawingモデルと多対1の関係を記述
  has_many :drawings, dependent: :destroy
  # statusカラムでenumを使用（進行中、成功、失敗）の3つの状態を持つ
  enum status: { in_progress: 0, success: 1, failure: 2 }
  # titleカラムに対して、値が空でないこと・最大255文字以下であること
  validates :game_title, presence: true, length: { maximum: 255 }
end
