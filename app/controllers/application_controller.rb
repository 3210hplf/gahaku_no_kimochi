class ApplicationController < ActionController::Base
  # gem 'sorcery'が提供するメソッド
  # ユーザーがログインしているかどうかを判定。ログインしていない場合は、not_authenticated メソッド
  before_action :require_login
  # フラッシュメッセージの種類を指定
  add_flash_types :success, :info, :warning, :error
  private

  # ログインしていない場合にログインページにリダイレクト
  def not_authenticated
    redirect_to login_path
  end
end
