class QuestionsController < ApplicationController
  # ログインしていないユーザーもplay, answer, indexアクションにアクセスできるようにする
  skip_before_action :require_login, only: %i[play answer index new create correct]
  def play
    @q = Question.all.sample
    @choices = @q.choices
  end

  def answer
    # params[:question_id]でおくられてきたquestionのidを取得
    @question = Question.find(params[:question_id])
    # params[:choice_id]でユーザーが選択したchoiceのidを取得
    @user_choice = @question.choices.find(params[:choice_id])
    # 選択したchoiceが正解の場合はtrue、不正解の場合はfalseを格納
    @is_correct = @user_choice.correct_answer
    # 正解の選択肢のanswerを取得
    @answer = @question.choices.find_by(correct_answer: true).answer
  end

  def new
    @question = Question.new
    # １つの入力フォームから4つのchoicesを生成
    4.times { @question.choices.build }
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      redirect_to root_path, success: 'がはくの作品をクイズに出展しました！'
    else
      flash.now[:danger] = '出展が上手くいきませんでした'
      render :new, status: :unprocessable_entity
    end
  end

  def correct
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
