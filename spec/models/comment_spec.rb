require 'rails_helper'

RSpec.describe Comment, type: :model do
  it { should belong_to :profile }
  it { should belong_to :image }
  it { should validate_presence_of :content }
end
