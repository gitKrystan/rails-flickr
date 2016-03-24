class ImagesController < CrudController
  before_action :set_profile, only: [:new, :create]
  before_action :set_image, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_image_owner, only: [:edit, :update, :destroy]

  def index
    @images = Image.all
  end

  def show
    @comments = @image.comments.order(created_at: :desc)
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

  def destroy
    @image.destroy
    flash[:notice] = 'Deleted image.'
    redirect_to root_path
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

  def authenticate_image_owner
    unless user_is_image_owner?
      flash[:notice] = 'You are not authorized to edit this image.'
      redirect_to @image
    end
  end
end
