class ShiritoriGame < ApplicationRecord
  # drawingモデルと多対1の関係を記述
  has_many :drawings, dependent: :destroy
  # userモデルと1対多の関係を記述
  belongs_to :user
  # statusカラムでenumを使用（進行中、成功、失敗）の3つの状態を持つ
  enum status: { in_progress: 0, success: 1, failure: 2 }
  # titleカラムに対して、値が空でないこと・最大255文字以下であること
  validates :game_title, presence: true, length: { maximum: 255 }

  # 未使用。一番進んでいるturn_countを取得する際に使用する
  def max_turn_count
    drawings.max_by(&:turn_count)&.turn_count || 0
  end

  def next_turn
    plus_count = drawings.count + 1
    if plus_count <= 5
      "#{plus_count}人目として投稿"
    elsif plus_count > 5
      'ゲーム終了'
    end
  end
end
