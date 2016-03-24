require 'rails_helper'

RSpec.describe Profile, type: :model do
  it { should belong_to :user }
  it { should have_many :images }
  it { should have_many :comments }
  it { should have_and_belong_to_many :favorites }
end
