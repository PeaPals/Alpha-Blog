class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :get_user, only: [:show, :destroy, :follow, :unfollow]
  before_action :user_is_not_current_user, only: [:destroy]


  def show

    if !params[:show]
      params[:show] = 'articles'
    end

    if params[:show] == 'articles'
      @resource = @user.articles.paginate(page: params[:page], per_page: 6)
      @articles = @user.articles.paginate(page: params[:page], per_page: 6)
      @resource_title = 'Articles'
      @resource_view = 'shared/articles-view'

    elsif params[:show] == 'followers'
      @resource = @user.followers.paginate(page: params[:page], per_page: 6)
      @users = @user.followers.paginate(page: params[:page], per_page: 6)
      @resource_title = 'Followers'
      @resource_view = 'shared/users-view'

    elsif params[:show] == 'following'
      @resource = @user.followings.paginate(page: params[:page], per_page: 6)
      @users = @user.followings.paginate(page: params[:page], per_page: 6)
      @resource_title = 'Following'
      @resource_view = 'shared/users-view'
    end

  end


  def index
    @users = User.paginate(page: params[:page], per_page: 6)
  end


  def destroy
    # current_user = nil

    @user.destroy
    flash[:notice] = "The account has been successfully cancelled."
    redirect_to root_path
  end


  def follow
    @user.followers << current_user
    redirect_to user_index_path
  end


  def unfollow
    Follow.find_by(following_user_id: current_user.id, followed_user_id: @user.id).destroy
    redirect_to user_index_path
  end




  private

  def get_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

  def user_is_not_current_user
    if current_user != @user
      flash[:alert] = "Only admins can perform this action."
      redirect_to @user
    end
  end
end
