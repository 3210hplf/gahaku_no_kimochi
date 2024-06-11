class StaticpagesController < ApplicationController
  # ログインしていないユーザーもアクセスできるようにする
  skip_before_action :require_login, only: %i[top]
  def top
  end
end
