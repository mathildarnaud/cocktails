class CocktailsController < ApplicationController


  before_action :set_cocktail, only: %i[show]

  def index
    @cocktails = Cocktail.all
    if params[:query].present?
      sql_query = <<~SQL
        lower(name) LIKE lower(:query)
        OR lower(ingredient1) LIKE lower(:query)
        OR lower(ingredient2) LIKE lower(:query)
        OR lower(ingredient3) LIKE lower(:query)
        OR lower(ingredient4) LIKE lower(:query)
      SQL
      @cocktails = Cocktail.where(sql_query, query: "%#{params[:query]}%")
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
def find_duplicates(array)
  duplicates = []
  array.each do |element|
    duplicates << element if array.count(element) > 1
  end
  duplicates.uniq
end
