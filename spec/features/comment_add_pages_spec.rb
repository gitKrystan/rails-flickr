require "rails_helper"

describe 'add a comment' do
  it 'allows a user to add a comment to an image' do
    user = create(:user_with_image)
    user_image = user.profile.images.first
    login_as(create(:user))
    visit image_path(user_image)
    click_link 'Add a Comment'
    fill_in 'comment-content', with: 'Test comment.'
    click_button 'Add Comment'
    expect(page).to have_content('Test comment.')
  end

  it 'allows a user to add a comment to a comment' do
    first_comment = create(:comment_on_image)
    image = first_comment.image
    login_as(create(:user))
    visit image_path(image)
    click_link 'Reply'
    fill_in 'comment-content', with: 'Test reply.'
    click_button 'Add Comment'
    expect(page).to have_content('Test reply.')
  end
end
