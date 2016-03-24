class ProfilesController < ApplicationController
  def show
    @profile = Profile.find(params[:id])
    @images = @profile.images.order(created_at: :desc)
    @favorites = @profile.favorites
  end
end
