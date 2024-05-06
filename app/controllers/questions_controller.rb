class QuestionsController < ApplicationController
  def play
    @q = Question.all.sample
    @choices = @q.choices
  end

  def correct
  end

  def incorrect
  end

  def new
    @question = Question.new
    # １つの入力フォームから4つのchoicesを生成
    4.times { @question.choices.build }
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      Rails.logger.info("Question was successfully saved.")
      redirect_to root_path
    else
      Rails.logger.info("Question was not saved. Errors: #{@question.errors.full_messages.join(", ")}")
      render 'new'
    end
  end

  def index
    @questions = Question.all
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy!
    redirect_to questions_path
  end
  
  private

  # ストロングパラメーターを定義
  def question_params
    params.require(:question).permit(
      :author, :age, :image, :image_cache,
      choices_attributes: [:id, :_destroy, :answer, :correct_answer]
    )
  end
end
