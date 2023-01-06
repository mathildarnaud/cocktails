class CocktailsController < ApplicationController


  before_action :set_cocktail, only: %i[show index]

  def index
    @cocktails = Cocktail.all
  end

  # def index
  #   if params[:query]
  #     @gaming_sessions = policy_scope(GamingSession)
  #     sql_query = "name ILIKE :query OR address ILIKE :query"
  #     @gaming_sessions = GamingSession.where(sql_query, query: "%#{params[:query]}%")
  #   elsif params[:gaming_session]
  #     @gaming_sessions = policy_scope(GamingSession)
  #     @gaming_sessions = GamingSession.where("game_type IN (?)", params[:gaming_session][:game_type])
  #   else
  #     @gaming_sessions = policy_scope(GamingSession)
  #   end
  #   @markers = @gaming_sessions.geocoded.map do |gaming_session|
  #     {
  #       lat: gaming_session.latitude,
  #       lng: gaming_session.longitude,
  #       info_window: render_to_string(partial: "info_window", locals: {gaming_session: gaming_session}),
  #       image_url: helpers.asset_url("location.png")
  #     }
  #   end
  # end


  def show
    @cocktail = Cocktail.find(params[:id])
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name)
  end

  def set_cocktail
    @cocktail = Cocktail.find(params[:id])
  end

end
