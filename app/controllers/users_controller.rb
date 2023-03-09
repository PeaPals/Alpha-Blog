class UsersController < ApplicationController
  before_action :get_user, only: [:show, :edit, :update, :destroy]
  before_action :require_user, except: [:new, :create, :show, :index]
  before_action :require_same_user, only: [:edit, :update, :destroy]


  def show
    @articles = @user.articles.paginate(page: params[:page], per_page: 6)
  end


  def index
    @users = User.paginate(page: params[:page], per_page: 6)
  end




  def new
    @user = User.new
  end


  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Welcome to the Alpha Blog #{@user.username}, sign-up successful."
      session[:user_id] = @user.id
      redirect_to @user
    else
      render 'new'
    end
  end


  def edit
  end

  def update
    if @user.update(user_params)
      flash[:notice] = "Profile updated successfully."
      redirect_to @user
    else
      render 'edit'
    end
  end


  def destroy
    @user.destroy
    session[:user_id] = nil
    flash[:notice] = "Account and all associated artices successfully deleted"
    redirect_to root_path
  end



  private

  def get_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

  def require_same_user
    if current_user != @user
      flash[:alert] = "You can only edit your own profile."
      redirect_to @user
    end
  end


end
