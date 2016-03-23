require "rails_helper"

describe 'edit an image' do
  before :each do
    @user = create(:user_with_image)
    @user_image = @user.profile.images.first
  end

  it 'allows a user to edit their image' do
    login_as(@user, scope: :user)
    visit root_path
    click_link "show-image-#{@user_image.id}"
    click_link 'edit-image'
    fill_in 'Name', with: 'Updated Image Name'
    click_button 'Update Image'
    expect(page).to have_content 'Updated Image Name'
  end

  it 'redirects another user who tries to edit the image' do
    login_as(create(:user))
    visit edit_image_path(@user_image)
    expect(page).to have_content('You are not authorized to edit this image.')
    expect(page).to have_content @user_image.name
    expect(page).not_to have_css '#edit-image'
  end
end
