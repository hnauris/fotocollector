class KamerasController < ApplicationController
  before_action :authenticate_user!
  before_action :is_owner?, only: [:edit, :update, :destroy]

  def index
    @kameras = Kamera.all
    @user = current_user
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


  def edit
    @kamera = Kamera.find(params[:id])
  end

  def update
    @kamera = Kamera.find(params[:id])
    @kamera.update(kamera_params)
    if @kamera.save
      flash[:success] = 'Kameras dati tika veiksmīgi atjaunināti!'
      redirect_to kameras_path
    else
      flash[:danger] = @kamera.errors.full_messages
      redirect_to kameras_path
    end
  end

  def destroy 
    @kamera = Kamera.find(params[:id])
    @kamera.destroy
    redirect_to kameras_path
  end

  private

  def kamera_params
    params.require(:kamera).permit(:user_id, :modelis, :razotajs, 
    :serijasnr, :valsts, :eksempsk, :cena, :papildinformacija, :vertejums, :photo)
  end

  def is_owner?
    @kamera = Kamera.find(params[:id])
    if current_user.id == @kamera.user_id
      return
    else
      flash[:danger] = "You are not authorized to perform this action!"
      redirect_to root_path
    end
  end
end
