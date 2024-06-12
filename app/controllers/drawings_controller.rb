class DrawingsController < ApplicationController
  def new
    @drawing = Drawing.new
  end

  def create
    @drawing = current_user.drawings.build(drawing_params)
    if @drawing.save
      redirect_to shiritori_game_path(@drawing.shiritori_game)
    else
      render :new
    end
  end

  private

  def drawing_params
    params.require(:drawing).permit(:title, :artwork, :artwork_cache, :turn_count, :shiritori_game_id)
  end
end
