class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:show, :edit]

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      flash[:success] = "ユーザを登録しました"
      redirect_to root_url
    else
      flash.now[:denger] = "ユーザの登録に失敗しました"
      render :new
    end  
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    
    if @user.update(user_params)
      flash[:success] = "プロフィールを更新しました"
      redirect_to @user
    else
      flash.now[:danger] = "プロフィールは更新されませんでした"
      render :edit
    end  
  end
  
  def qlists
    @user = User.find(params[:id])
    @questions = @user.questions.order(id: :desc)
  end
  
  def alists
    @user = User.find(params[:id])
    @answers = @user.answers.order(id: :desc)
  end  
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :age, :password, :password_confirmation)
  end 
  
  
end
