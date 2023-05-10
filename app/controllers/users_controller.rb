include ActionView::Helpers::DateHelper

class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :get_user, only: [:show, :follow, :unfollow]


  def show
    if !params[:show]
      params[:show] = 'Articles'
    end

    @articles = params[:show] == 'Articles' ? @user.articles.all : []
    @followers = params[:show] == 'Followers' ? @user.followers.all : []
    @followings = params[:show] == 'Following' ? @user.followings.all : []

    response = transform_users([@user])[0]

    response[:articles] = transform_articles(@articles)
    response[:followers] = transform_users(@followers)
    response[:followings] = transform_users(@followings)

    render json: response

  end


  def index
    @users = User.all
    render json: {allUsers: transform_users(@users)}
  end


  def destroy
    current_user.destroy
    render json: {status: true}
  end


  def follow
    @user.followers << current_user
    render json: {status: true}
  end


  def unfollow
    Follow.find_by(following_user_id: current_user.id, followed_user_id: @user.id).destroy
    render json: {status: true}
  end




  private
  def transform_articles(articles)
    new_articles = []

    articles.each do |article|
      new_articles << {article: article, categories: article.categories, user: article.user, createdAt: time_ago_in_words(article.created_at), updatedAt: time_ago_in_words(article.updated_at)}
    end

    return new_articles
  end

  def transform_users(users)
    new_users = []

    users.each do |user|
      follow_back = Follow.find_by(following_user_id: user.id, followed_user_id: current_user.id)
      is_following = Follow.find_by(following_user_id: current_user.id, followed_user_id: user.id)

      new_users << {user: user, isFollowing: is_following, createdAt: time_ago_in_words(user.created_at), updatedAt: time_ago_in_words(user.updated_at), followBack: follow_back, totalArticles: user.articles.count, totalFollowers: user.followers.count, totalFollowing: user.followings.count}
    end

    return new_users
  end

  def get_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
