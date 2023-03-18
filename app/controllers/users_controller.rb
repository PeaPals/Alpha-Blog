class UsersController < ApplicationController
  before_action :get_user, only: [:show, :edit, :update]
  before_action :authenticate_user!, except: [:show, :index, :edit, :update]
  before_action :user_is_admin, only: [:edit, :update]


  def show
    @articles = @user.articles.paginate(page: params[:page], per_page: 6)
  end


  def index
    @users = User.paginate(page: params[:page], per_page: 6)
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


  # def destroy
  #   if (current_user.admin? && current_user == @user) || !current_user.admin?
  #     session[:user_id] = nil
  #   end


  #   @user.destroy
  #   flash[:notice] = "Account and all associated artices successfully deleted"
  #   redirect_to root_path
  # end



  private

  def get_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

  def user_is_admin
    if !current_user || !current_user.admin?
      flash[:alert] = "Only admins can perform this action."
      redirect_to @user
    end
  end



end
