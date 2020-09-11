class DosesController < ApplicationController
  def new; end

  def create
    create_dose = Dose.new(dose_params)
    cocktail = Cocktail.find(params[:cocktail_id])
    create_dose.cocktail = cocktail
    create_dose.save
    redirect_to cocktail_path(cocktail)
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
end
