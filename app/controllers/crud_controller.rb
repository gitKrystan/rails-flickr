class CrudController < ApplicationController
  before_action :authenticate_user!, except: [ :index, :show ]

  private

  def user_is_image_owner?
    current_user == @image.profile.user
  end
  helper_method :user_is_image_owner?
end
