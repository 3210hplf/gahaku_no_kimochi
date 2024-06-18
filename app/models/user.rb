class User < ApplicationRecord
  authenticates_with_sorcery!
  # drawingモデルと多対1の関係を記述
  has_many :drawings, dependent: :destroy
  # shiritori_gameモデルと多対1の関係を記述
  has_many :shiritori_games, dependent: :destroy
  # password；最小で3文字以上必要（新規レコード作成もしくはcrypted_passwordカラムが更新される時のみ適応）
  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  # password_confirmation：値が空でないこと・passwordの値と一致すること（新規レコード作成もしくはcrypted_passwordカラムが更新される時のみ適応）
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }
  # 値が空でないこと・最大255文字以下であること
  validates :name, presence: true, length: { maximum: 255 }
  # 値が空でないこと・ユニークな値であること
  validates :email, presence: true, uniqueness: true

  # 渡された(object)はそのユーザーが作成したかを確認するメソッド
  def own?(object)
    id == object&.user_id
  end
end
