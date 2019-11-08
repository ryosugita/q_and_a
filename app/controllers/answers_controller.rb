class AnswersController < ApplicationController

  def create
    @answer = current_user.answers.build(answer_params)
    @question = Question.find(params["question_id"])
    @answer.question_id = @question.id
    if @answer.save
      flash[:success] = '回答を投稿しました。'
      redirect_to @question
    else
      flash.now[:danger] = '回答の投稿に失敗しました。'
      render 'questions/show'
    end
  end
  
  private
  
  def answer_params
    params.require(:answer).permit(:content)
  end  
end
