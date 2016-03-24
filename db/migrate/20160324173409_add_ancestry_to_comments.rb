class AddAncestryToComments < ActiveRecord::Migration
  def change
    add_column :comments, :ancestry, :string
    change_column :comments, :commentable_id, :integer, polymorphic: false
    rename_column :comments, :commentable_id, :image_id
  end
end
