class ImagesController < CrudController
  before_action :set_profile, only: [:new, :create]
  before_action :set_image, only: [:show, :edit, :update]
  before_action :authenticate_image_owner, only: [:edit, :update]

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

  def user_is_image_owner?
    current_user == @image.profile.user
  end
  helper_method :user_is_image_owner?

  def authenticate_image_owner
    unless user_is_image_owner?
      flash[:notice] = 'You are not authorized to edit this image.'
      redirect_to @image
    end
  end
end
