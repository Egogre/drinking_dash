class DrinksController < ApplicationController
  before_action :set_drink, only: [:show, :edit, :update, :destroy]
  before_action :admin_authorization, only: [:edit, :update, :new, :create, :destroy]

  def index
    @drinks = Drink.search(params[:search])
  end

  def show
  end

  def new
    @drink = Drink.new
  end

  def create
    @drink = Drink.new(drink_params)

    respond_to do |format|
      if @drink.save
        format.html { redirect_to @drink, notice: 'Drink was successfully created.' }
        flash.notice = "New Drink, '#{@drink.name}', Created!"
      else
        format.html { render action: 'new' }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @drink.update(drink_params)
        format.html { redirect_to @drink, notice: 'Drink was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  def destroy
    @drink.destroy
    redirect_to dashboard_path
    flash.notice = "#{@drink.name} destroyed!"
  end

  private
    def set_drink
      @drink = Drink.find(params[:id])
    end

    def drink_params
      params.require(:drink).permit(:name, :description, :price, :category_id, :image_url)
    end



end
