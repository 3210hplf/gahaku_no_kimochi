class DrawingsController < ApplicationController
  def new
    @drawing = Drawing.new
  end

  def create
    @drawing = current_user.drawings.build(drawing_params)
    if @drawing.save
      # しりとりゲームのステータスを更新
      @drawing.shiritori_game.check_status
      redirect_to shiritori_game_path(@drawing.shiritori_game), notice: '画伯の絵を投稿しました！'
    else
      flash.now[:alert] = '画伯の絵の投稿に失敗しました。'
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @drawing = Drawing.find(params[:id])
  end

  def update
    @drawing = Drawing.find(params[:id])
    if @drawing.update(drawing_params)
      @drawing.shiritori_game.check_status
      redirect_to shiritori_game_path(@drawing.shiritori_game), notice: '画伯の絵を更新しました！'
    else
      flash.now[:alert] = '画伯の絵の更新に失敗しました。'
      render :edit, status: :unprocessable_entity
    end
  end


  private

  def drawing_params
    params.require(:drawing).permit(:title, :artwork, :artwork_cache, :turn_count, :shiritori_game_id)
  end
end
