class ImagesController < ApplicationController
  before_action :set_profile, only: [:new, :create, :show]

  def index
  end

  def show
    @image = Image.find(params[:id])
  end

  def new
    @image = Image.new
  end

  def create
    @image = @profile.images.new(image_params)
    if @image.save
      flash[:notice] = 'Your image has been uploaded!'
      redirect_to [@profile, @image]
    else
      render 'new'
    end
  end

  private

  def image_params
    params.require(:image).permit(:name, :file)
  end

  def set_profile
    @profile = Profile.find(params[:profile_id])
  end
end
