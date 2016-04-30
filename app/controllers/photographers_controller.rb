class PhotographersController < ApplicationController
  before_action :set_photographer, only: [:show, :edit, :update]
  before_action :authenticate_user!, except: [:show]

  def index
    @photographer = current_user.photographer
    @photos = @photographer.photos
  end

  def show
    @photos = @photographer.photos
  end

  def new
    @photographer = Photographer.new
  end

  def create
    @photographer = Photographer.new(photographer_params)
    @photographer.user_id = current_user.id
    
    if @photographer.save 

      if params[:images]
        params[:images].each do |image|
          @photographer.photos.create(image: image)
        end
      end

      
      @photos = @photographer.photos
      redirect_to photographer_path(@photographer), notice: "Dati inseriti con successo."
    else
      redirect_to new_photographer_path, alert: "Ops! Si è verificato un errore. Per favore inserisci tutte le informazioni richieste e almeno una foto. Ricorda anche che i prezzi devono essere numeri interi"
    end
  end

  def edit
    if current_user.photographer == @photographer
      @photos = @photographer.photos
    else
      redirect_to root_path, alert: "Accesso negato"
    end
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
      render :edit, alert: "Ops! Si è verificato un errore. Per favore inserisci tutte le informazioni richieste e almeno una foto. Ricorda anche che i prezzi devono essere numeri interi"
    end
  end

  private
    def set_photographer
      @photographer = Photographer.find(params[:id])
    end

    def photographer_params
      params.require(:photographer).permit(:nome, :titolo, :descrizione, :indirizzo, :imprevisti, :tempi_consegna, :num_foto, :durata_video, :foto_cerimonia, :video_cerimonia, :foto_pre, :video_pre, :foto_post, :video_post, :second_camera, :second_videocamera, :album, :mini_album, :foto_hd, :negativi, :dvd, :trailer_foto, :trailer_video, :drone)
    end
end
