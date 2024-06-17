class StaticpagesController < ApplicationController
  # ログインしていないユーザーもアクセスできるようにする
  skip_before_action :require_login, only: %i[top]
  def top
    @drawings = Drawing.all
    @questions = Question.all
  end
end
