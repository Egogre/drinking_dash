class DrinksController < ApplicationController

  def index
    @drinks = Drink.all
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
        format.html { redirect_to drinks_path, notice: 'Drink was successfully created.' }
        format.json { render action: 'show', status: :created, location: @drink }
        flash.notice = "New Drink, '#{@drink.name}', Created!"
      else
        format.html { render action: 'new' }
        format.json { render json: @drink.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @drink.update(drink_params)
        format.html { redirect_to @drink, notice: 'Drink was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @drink.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def set_drink
      @drink = Drink.find(params[:id])
    end

    def drink_params
      params.require(:drink).permit(:name, :description, :price, :category_id)
    end



end
