class UsersController < ApplicationController
  # ログインしていないユーザーもnew, createアクションにアクセスできる
  skip_before_action :require_login, only: %i[new create]

  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to login_path, success: 'がはくを登録しました'
    else
      flash.now[:danger] = 'がはくの登録に失敗しました'
      render :new, status: :unprocessable_entity
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
