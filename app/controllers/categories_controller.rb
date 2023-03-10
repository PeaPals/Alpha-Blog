class CategoriesController < ApplicationController
  before_action :get_category, only: [:show]
  before_action :require_admin, except: [:show, :index]



  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      flash[:notice] = "Category was successfully created"
      redirect_to @category
    else
      render 'new'
    end

  end

  def index
    @categories = Category.paginate(page: params[:page], per_page: 9)
  end

  def show
  end



  private

  def get_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end

  def require_admin
    if !(logged_in? && current_user.admin?)
      flash[:alert] = "Only admins can perform this action."
      redirect_to "/categories"
    end
  end

end
