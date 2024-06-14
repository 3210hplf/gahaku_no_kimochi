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

  # shiritori_games#showで使用。次のターンを表示するためのメソッド
  # 5人目まで投稿されたら「ゲーム終了」と表示
  def next_turn
    plus_count = drawings.count + 1
    if plus_count <= 5
      "#{plus_count}人目として投稿"
    elsif plus_count > 5
      'ゲーム終了'
    end
  end

  # 投稿5つが揃ったら、しりとりが成功か失敗かを判定するメソッド
  # 成功した場合statusをsuccessに、失敗した場合statusをfailureに変更する
  # 投稿が5つ未満の場合は判定を行わずstatusをin_progressのままにする
  def check_status
    if self.drawings.count == 5
      title_a = self.drawings.map { |d| d.title }
      if title_a[0].split('').last == title_a[1].split('').first &&
        title_a[1].split('').last == title_a[2].split('').first &&
        title_a[2].split('').last == title_a[3].split('').first &&
        title_a[3].split('').last == title_a[4].split('').first
        self.success!
      else
        self.failure!
      end
    elsif self.drawings.count < 5
      self.in_progress!
    end
  end

end
