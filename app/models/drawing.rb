class Drawing < ApplicationRecord
  # userモデルと1対多の関係を記述
  belongs_to :user
  # shiritori_gameモデルと1対多の関係を記述
  belongs_to :shiritori_game
  # 画像をアップロードするための記述
  mount_uploader :artwork, ArtworkUploader
  # turn_countカラムでenumを使用（1ターン目、2ターン目、3ターン目、4ターン目、5ターン目）の5つの状態を持つ
  enum turn_count: { first_turn: 0, second_turn: 1, third_turn: 2, fourth_turn: 3, fifth_turn: 4 }
  # titleカラムに対して、値が空でないこと・最大15文字以下であること
  validates :title, presence: true, length: { maximum: 15 }

  # しりとりが進行中の場合タイトルを隠し、成功か失敗の結果が出るとタイトルを表示するメソッド
  def display_title
    shiritori_game.in_progress? ? '⚫︎' * self.title.length : self.title
  end
end
