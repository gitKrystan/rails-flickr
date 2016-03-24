class AddImageIndexToComments < ActiveRecord::Migration
  def change
    add_index :comments, :image_id
  end
end
