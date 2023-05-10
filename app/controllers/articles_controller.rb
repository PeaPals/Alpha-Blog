include ActionView::Helpers::DateHelper

class ArticlesController < ApplicationController
  before_action :authenticate_user!
  before_action :get_article, only: [:show, :update, :edit, :destroy]
  before_action :require_same_user, only: [:edit, :update, :destroy]

  def show
    render json: transform_articles([@article])[0]
  end

  def index
    if params[:show] && params[:show] == 'my-feed'
      @articles = []

      current_user.followings.each do |following_user|
        @articles += following_user.articles
      end

    else
      @articles = Article.all
    end



    render json: {allArticles: transform_articles(@articles)}
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.user = current_user

    if @article.save
      render json: {article: transform_articles([@article])[0]}
    else
      render json: {errors: @article.errors.full_messages}
    end
  end


  def update
    if @article.update(article_params)
      render json: {status: true, article: @article}
    else
      render json: {status: false, errors: @article.errors.full_messages}
    end
  end


  def edit
  end


  def destroy
    @article.destroy
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


  def get_article
    @article = Article.find(params[:id])
  end

  def article_params
    params[:article][:category_ids] = params[:category_ids]
    return params.require(:article).permit(:title, :description, category_ids: [])
  end

  def require_same_user
    if current_user != @article.user
      flash[:alert] = "You can only edit or delete your own article."
      redirect_to @article
    end
  end


end
