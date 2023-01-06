class AlcoolsController < ApplicationController
  before_action :set_alcool, only: %i[show]

  def index
    @alcools = Alcool.all
  end

  

  def show
    @alcool = Alcool.find(params[:id])
  end
end

private

def alcool_params
  params.require(:alcool).permit(:name)
end

def set_alcool
  @alcool = Alcool.find(params[:id])
end
