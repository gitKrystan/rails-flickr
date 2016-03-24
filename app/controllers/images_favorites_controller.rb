class ImagesFavoritesController < CrudController
  def new
    profile = current_user.profile
    image = Image.find(params[:image_id])
    profile.favorites<<(image)
    redirect_to image
  end

  def edit
    profile = current_user.profile
    image = Image.find(params[:id]) # :id is same as :image_id
    profile.favorites.destroy(image)
    redirect_to image
  end
end
