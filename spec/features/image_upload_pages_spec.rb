require "rails_helper"

describe 'upload an image' do
  before :each do
    user = create(:user)
    login_as(user, scope: :user)
    visit root_path
    click_link 'add-image'
  end

  it 'uploads a selected image' do
    fill_in 'Name', with: 'My Cat'
    page.attach_file('File', 'spec/fixtures/images/cat.jpg')
    click_button 'Create Image'
    expect(page).to have_content 'My Cat'
  end

  it 'uploads a selected image' do
    click_button 'Create Image'
    expect(page).to have_content 'errors'
  end
end
