module ApplicationHelper
  def is_favorited?(image = @image)
    current_user.profile.favorites.include?( image )
  end
end
