class CocktailsController < ApplicationController
  def index
    @cocktails = Cocktail.all
  end

  def search
    @query = params[:q]
    @cocktails = Cocktail.where("name ILIKE ?", "%#{@query}%")
    render :search
  end

  def new
    @cocktail = Cocktail.new
    @auto_names = make_inspiration
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    @auto_names = make_inspiration
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
    @review = Review.new
  end

  def make_inspiration
    names = []
    5.times do
      adjective = [Faker::Color.color_name, Faker::Hipster.word].sample
      noun = [Faker::House.room, Faker::Name.first_name, Faker::Space.moon, Faker::Artist.name].sample
      names << "#{adjective} #{noun}"
    end
    names
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name, :photo)
  end
end
