class CocktailsController < ApplicationController


  before_action :set_cocktail, only: %i[show]

  def index
    @cocktails = Cocktail.all
    if params[:query].present?
      @cocktails = @cocktails.where('name ILIKE ?', "%#{params[:query]}%")
    end
  end


  def show
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name)
  end

  def set_cocktail
    @cocktail = Cocktail.find(params[:id])
  end
end
