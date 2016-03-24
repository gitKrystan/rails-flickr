module ApplicationHelper
  def is_favorited?
    current_user.profile.favorites.include?( @image )
  end
end
