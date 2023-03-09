class ArticlesController < ApplicationController
  before_action :get_article, only: [:show, :update, :edit, :destroy]


  def show
  end

  def index
    @articles = Article.paginate(page: params[:page], per_page: 6)
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)

    if logged_in?
      @article.user = current_user
    end

    if @article.save
      flash[:notice] = "Article was created successfully"
      redirect_to article_path(@article)
    else
      render 'new'
    end
  end


  def update
    if @article.update(article_params)
      flash[:notice] = "Article was updated successfully"
      redirect_to @article
    else
      render 'edit'
    end
  end


  def edit
  end


  def destroy
    @article.destroy
    redirect_to '/articles'
  end


  private

  def get_article
    @article = Article.find(params[:id])
  end

  def article_params
    return params.require(:article).permit(:title, :description)
  end


end
