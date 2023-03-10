class CategoriesController < ApplicationController
  # before_action :get_user, only: [:show, :edit, :update, :destroy]


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

  # def require_same_user
  #   if (current_user != @user && !current_user.admin?)
  #     flash[:alert] = "You can only edit or delete your own profile."
  #     redirect_to @user
  #   end
  # end

end
