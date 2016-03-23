class ImagesController < ApplicationController
  before_action :set_profile, only: [:new, :create]
  before_action :set_image, only: [:show, :edit, :update]

  def index
    @images = Image.all
  end

  def show
  end

  def new
    @image = Image.new
  end

  def edit
  end

  def create
    @image = @profile.images.new(image_params)
    if @image.save
      flash[:notice] = 'Your image has been uploaded!'
      redirect_to @image
    else
      render 'new'
    end
  end

  def update
    if @image.update(image_params)
      flash[:notice] = 'Your image has been updated!'
      redirect_to @image
    else
      render 'edit'
    end
  end

  private

  def image_params
    params.require(:image).permit(:name, :file)
  end

  def set_image
    @image = Image.find(params[:id])
  end

  def set_profile
    @profile = Profile.find(params[:profile_id])
  end
end
