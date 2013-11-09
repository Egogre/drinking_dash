class CategoriesController < ApplicationController
  before_action :set_category, only: [:show]

  def index
    @categories = Category.all
  end

  def show
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.new_record?
      redirect_to category_path(@category)
      flash.notice = "New Category, '#{@category.drink_type}', Created!"
    else
      redirect_to new_category_path, notice: "You messed up son!"
    end
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:drink_type, :image_url)
  end
end
