class CategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :get_category, only: [:show]


  def index
    @categories = Category.all
    render json: {allCategories: @categories}
  end

  def show
    @articles = @category.articles.all
    render json: {category: @category, categoryArticles: @articles}
  end



  private

  def get_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end

end
