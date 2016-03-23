class RenameImagesUserProfilesToProfiles < ActiveRecord::Migration
  def change
    rename_column :images, :user_profile_id, :profile_id
  end
end
