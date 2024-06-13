class ShiritoriGamesController < ApplicationController
  def new
    @shiritori_game = ShiritoriGame.new
  end

  def create
    @shiritori_game = current_user.shiritori_games.build(shiritori_game_params)
    if @shiritori_game.save
      redirect_to new_shiritori_game_drawing_path(@shiritori_game), notice: 'ゲームのお題を作成しました! あなたが1人目のがはくとなりましょう!'
    else
      flash.now[:alert] = 'お題の作成に失敗しました。'
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @shiritori_games = ShiritoriGame.all
  end

  def show
    @shiritori_game = ShiritoriGame.find(params[:id])
    @drawing = Drawing.new
    @drawings = @shiritori_game.drawings.includes(:user)
  end

  private

  def shiritori_game_params
    params.require(:shiritori_game).permit(:game_title, :status)
  end
end
