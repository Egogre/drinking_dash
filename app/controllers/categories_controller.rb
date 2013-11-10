class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update]
  before_action :admin_authorization, only: [:edit, :update, :new, :create]

  def index
    @categories = Category.all
  end

  def show
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def edit
  end

  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to @category, notice: 'Category was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  def create
    @category = Category.new(category_params)

    if @category.new_record?
      @category.save
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
