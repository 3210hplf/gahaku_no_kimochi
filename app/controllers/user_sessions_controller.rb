class UserSessionsController < ApplicationController
  # ログインしていないユーザーもnew, createアクションにアクセスできる
  skip_before_action :require_login, only: %i[new create]

  def new; end

  def create
    # loginメソッドはsorceryが提供するメソッド
    # 指定されたメアドとパスワードがDB内のユーザー情報と一致するかどうかを確認
    @user = login(params[:email], params[:password])

    if @user
      redirect_to shiritori_games_path, success: 'ようこそ！ログイン完了です！'
    else
      flash.now[:danger] = 'ログインが上手くいきませんでした'
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    # logoutメソッドはsorceryが提供するメソッド
    # ログアウト処理を行う
    logout
    # redirect_toメソッドでstatus: :see_otherを指定すると、POSTリクエスト後の新しいページへのGETリクエスト移動が促され、フォームの再送信を防ぐことができる
    redirect_to root_path, status: :see_other, success: 'ログアウトしました'
  end
end
