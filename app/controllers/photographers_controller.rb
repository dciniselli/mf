class PhotographersController < ApplicationController
  before_action :set_photographer, only: [:show, :edit, :update]
  before_action :authenticate_user!, except: [:show, :index]
  before_action :authenticate_photographer, except: [:new, :show, :create, :index]

  def index
    @photographer = current_user.photographer
    @photos = @photographer.photos
  end

  def show
    @photos = @photographer.photos

    @km_trasferta = @photographer.distance_from(session[:loc_search]).to_i

    if @km_trasferta <= (@photographer.free_km ? @photographer.free_km : 0)
      @trasferta_price = 0
    elsif @km_trasferta >= (@photographer.max_km ? @photographer.max_km : 9999999)
      redirect_to photographer_path(@photographer), alert: "Purtroppo questo fotografo non effettua trasferte cosi lunghe."
    else
      @trasferta_price = (@km_trasferta * @photographer.price_km).to_i
    end
  end

  def new
    @photographer = Photographer.new
  end

  def create
    @photographer = Photographer.new(photographer_params)
    @photographer.id = current_user.id
    @photographer.user_id = current_user.id
    
    if @photographer.save 

      #creiamo le foto e le impostiamo come relativa al fotografo
      if params[:images]
        params[:images].each do |image|
          @photographer.photos.create(image: image)
        end
      end

      
      @photos = @photographer.photos
      redirect_to photographer_path(@photographer), notice: "Dati inseriti con successo."
    else
      redirect_to new_photographer_path, alert: "Ops! Si è verificato un errore."
    end
  end

  def edit
  end

  def update
    if @photographer.update(photographer_params)
      if params[:images]
        params[:images].each do |image|
          @photographer.photos.create(image: image)
        end
      end

      redirect_to photographer_path(@photographer), notice: "Dati aggiornati con successo."
    else
      render :edit, alert: "Ops! Si è verificato un errore."
    end
  end

  private
    def set_photographer
      @photographer = Photographer.find(params[:id])
    end

    def authenticate_photographer
        if current_user.photographer != @photographer || current_user.photographer.blank?
          redirect_to root_path, alert: "Accesso negato"
        end
    end

    def photographer_params
      params.require(:photographer).permit(:nome, :titolo, :descrizione, :indirizzo, :imprevisti, :tempi_consegna, :num_foto, :durata_video, 
                      :foto_cerimonia, :video_cerimonia, :foto_pre, :video_pre, :foto_post, :video_post, :second_camera, :second_videocamera, 
                      :album, :mini_album, :foto_hd, :negativi, :dvd, :trailer_foto, :trailer_video, :drone, :cancellazione, :free_km, :price_km, 
                      :max_km, :prematrimoniale_foto, :prematrimoniale_video, :trash_dress_foto, :trash_dress_video)
    end
end
