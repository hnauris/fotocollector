class KamerasController < ApplicationController
  before_action :authenticate_user!

  def index
    @kameras = Kamera.all
  end

  def new
    @kamera = Kamera.new  
  end

  def create
    @kamera = Kamera.new(kamera_params)
    @kamera.user_id = current_user
    current_user.kameras << @kamera
    if @kamera.save
      flash[:success] = 'Kamera tika pievienota veiksmīgi!'
      redirect_to root_path 
    else  
      flash[:danger] = @kamera.errors.full_messages
      render 'new'
    end
  end

  def kopsavilkums
  end

  private

  def kamera_params
    params.require(:kamera).permit(:user_id, :modelis, :razotajs, 
    :serijasnr, :valsts, :eksempsk, :cena, :papildinformacija, :vertejums)
  end
end
