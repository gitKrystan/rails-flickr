require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_one :profile }

  it 'creates a user profile association upon initialization' do
    user = create(:user)
    expect(user.profile).to be_truthy
  end
end
