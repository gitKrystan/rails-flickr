require 'rails_helper'

RSpec.describe Image, type: :model do
  it { should belong_to :profile }
  it { should have_many(:comments).dependent(:destroy) }
  it { should have_attached_file :file }
  it { should validate_attachment_content_type(:file)
              .allowing('image/png', 'image/gif')
              .rejecting('text/plain', 'text/xml') }
  it { should have_and_belong_to_many :favoritors }
end
