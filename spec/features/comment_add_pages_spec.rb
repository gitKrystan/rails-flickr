require "rails_helper"

describe 'add a comment' do
  before :each do
    user = create(:user_with_image)
    @user_image = user.profile.images.first
  end

  it 'allows a user to add a comment' do
    login_as(create(:user))
    visit image_path(@user_image)
    click_link 'Add a Comment'
    fill_in 'comment-content', with: 'Test comment.'
    click_button 'Add Comment'
    expect(page).to have_content('Test comment.')
  end
end
