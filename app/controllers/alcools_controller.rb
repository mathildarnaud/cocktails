class AlcoolsController < ApplicationController
  before_action :set_alcool, only: %i[show]

  def index
    @alcools = Alcool.all
    if params[:query].present?
      @alcools = Alcool.where('lower(name) LIKE lower(?)', "%#{params[:query]}%")
    end
  end



  def show
    @cocktails = Cocktail.all
  end

  def search
    @cocktails = Cocktail.all
  end

  private

  def alcool_params
    params.require(:alcool).permit(:name)
  end

  def set_alcool
    @alcool = Alcool.find(params[:id])
  end
end
