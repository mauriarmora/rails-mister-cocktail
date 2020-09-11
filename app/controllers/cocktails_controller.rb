class CocktailsController < ApplicationController
  def home; end

  def index
    @cocktails = Cocktail.all
  end

  def show
    @cocktail = Cocktail.find(params[:id])
    @new_dose = Dose.new
  end

  def new
    @new_cocktail = Cocktail.new
  end

  def create
    create_cocktail = Cocktail.create(cocktail_params)

    redirect_to cocktail_path(create_cocktail)
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name)
  end
end
