class PagesController < ApplicationController
  def home
  	@photographers = Photographer.all
  end
end
