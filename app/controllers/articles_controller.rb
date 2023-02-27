class ArticlesController < ApplicationController
  def show
    byebug
    @article_1 = Article.find(
    params[:id]
    )
  end
end
