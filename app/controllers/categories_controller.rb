include ActionView::Helpers::TextHelper
include ActionView::Helpers::DateHelper

class CategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :get_category, only: [:show]


  def index
    @categories = Category.all
    render json: {allCategories: transform_categories(@categories)}
  end

  def show
    @articles = @category.articles.all
    render json: {category: @category, allArticles: transform_articles(@articles), mentionedIn: pluralize(@category.articles.count, "Article"), createdAt: time_ago_in_words(@category.created_at), updatedAt: time_ago_in_words(@category.updated_at)}
  end



  private
  def transform_articles(articles)
    new_articles = []

    articles.each do |article|
      new_articles << {article: article, categories: article.categories, user: article.user, createdAt: time_ago_in_words(article.created_at), updatedAt: time_ago_in_words(article.updated_at)}
    end

    return new_articles
  end

  def transform_categories(categories)
    new_categories = []

    categories.each do |category|
      new_categories << {category: category, mentionedIn: pluralize(category.articles.count, "Article"), createdAt: time_ago_in_words(category.created_at), updatedAt: time_ago_in_words(category.updated_at)}
    end

    return new_categories
  end

  def get_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end

end
