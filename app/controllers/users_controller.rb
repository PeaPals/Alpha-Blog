class UsersController < ApplicationController
  before_action :get_user, only: [:show, :edit, :update]


  def show
    @articles = @user.articles
  end



  def new
    @user = User.new
  end


  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Welcome to the Alpha Blog #{@user.username}, sign-up successful."
      redirect_to articles_path
    else
      render 'new'
    end
  end


  def edit
  end

  def update
    if @user.update(user_params)
      flash[:notice] = "Profile updated successfully."
      redirect_to articles_path
    else
      render 'edit'
    end
  end



  private

  def get_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end


end
