class CategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :get_category, only: [:show]


  def index
    @categories = Category.paginate(page: params[:page], per_page: 9)
  end

  def show
    @articles = @category.articles.paginate(page: params[:page], per_page: 6)
  end



  private

  def get_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end

end
