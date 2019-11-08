class QuestionsController < ApplicationController
  before_action :require_user_logged_in, only: [:new, :create]
  before_action :correct_user, only: [:destroy]
  def show
    if logged_in?
      @answer = current_user.answers.build
      @question = Question.find(params[:id])
    else
      @question = Question.find(params[:id])
    end  

  end

  def new
    if logged_in?
      @question = current_user.questions.new
    end  
  end

  def create
    @question = current_user.questions.new(question_params)
    
    if @question.save
      flash[:success] = "質問を投稿しました"
      redirect_to root_url
    else
      flash.now[:danger] = "質問の投稿に失敗しました"
      render "new"
    end  
  end
  
  def destroy
    @question.destroy
    flash[:success] = "質問を削除しました"
    redirect_to root_url

  end  
  
  private
  
  def question_params
    params.require(:question).permit(:content)
  end  
  
  def correct_user
    @question = current_user.questions.find_by(id: params[:id])
    unless @question
      redirect_to root_url
    end
  end
end
