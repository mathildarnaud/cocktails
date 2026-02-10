class PagesController < ApplicationController
  def home
    @alcools = Alcool.all
  end
end
