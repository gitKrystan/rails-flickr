require "rails_helper"

describe 'edit an image' do
  before :each do
    user = create(:user_with_image)
    user_image = user.profile.images.first
    login_as(user, scope: :user)
    visit root_path
    click_link "show-image-#{user_image.id}"
  end

  it 'allows a user to edit their image' do
    click_link 'edit-image'
    fill_in 'Name', with: 'Updated Image Name'
    click_button 'Update Image'
    expect(page).to have_content 'Updated Image Name'
  end
end
