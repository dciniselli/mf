class PagesController < ApplicationController
  def home
  	@photographers = Photographer.all
  end

  def search

  	if params[:search].present? && params[:search].strip != ""
  		session[:loc_search] = params[:search]
  	end

    if user_signed_in? && (session[:loc_search] && session[:loc_search] != "")
      @user = current_user
      @user.indirizzo = session[:loc_search]
    end

  	arrResult = Array.new
  	@all_photographers = Photographer.all

  	if session[:loc_search] && session[:loc_search] != ""
  		@all_photographers.each do |photographer|
			@available_photographers = Photographer.near(session[:loc_search], (photographer.max_km.blank? ? 99999 : photographer.max_km), order: 'distance')
		  end
  	else
  		@available_photographers = Photographer.all
  	end

  	@search = @available_photographers.ransack(params[:q])
  	@photographers = @search.result

  	@arrPhotographers = @photographers.to_a

  end
end
