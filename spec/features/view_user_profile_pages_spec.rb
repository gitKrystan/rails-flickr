require "rails_helper"

describe 'view a user profile' do
  it 'shows the user their own profile page' do
    user = create(:user)
    login_as(user)
    visit root_path
    click_link 'View My Profile'
    expect(page).to have_content(user.email)
  end
end
