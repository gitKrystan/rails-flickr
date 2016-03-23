require "rails_helper"

describe 'upload an image' do
  it 'uploads a selected image' do
    user = create(:user)
    login_as(user, scope: :user)
    visit root_path
    click_link 'add-image'
    fill_in 'Name', with: 'My Cat'
    page.attach_file('File', 'spec/fixtures/images/cat.jpg')
    click_button 'Upload'
    expect(page).to have_content 'My Cat'
  end
end
