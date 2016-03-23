require "rails_helper"

describe 'delete an image' do
  before :each do
    @user = create(:user_with_image)
    @user_image = @user.profile.images.first
  end

  it 'allows a user to delete one of their images' do
    login_as(@user, scope: :user)
    visit edit_image_path(@user_image)
    click_link 'delete-image'
    expect(page).to have_content 'Deleted image'
  end
end
