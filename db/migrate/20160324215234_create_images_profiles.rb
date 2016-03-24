class CreateImagesProfiles < ActiveRecord::Migration
  def change
    create_table :images_profiles do |t|
      t.references :image, index: true, foreign_key: true
      t.references :profile, index: true, foreign_key: true
    end
  end
end
