class CocktailsController < ApplicationController
  def index
    @cocktails = Cocktail.all
  end

  def search

  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def show
    @cocktail = Cocktail.find(params[:id])
    @ingredients = Ingredient.where.not(id: @cocktail.ingredients).order(name: :asc)
    @dose = Dose.new
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name)
  end
end
