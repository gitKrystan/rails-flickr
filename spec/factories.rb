include ActionDispatch::TestProcess

FactoryGirl.define do
  factory :user do
    sequence :email do |n|
      "test-#{n}@example.com"
    end
    password 'f4k3p455w0rd'

    factory :user_with_image do
      after(:create) do |user|
        create(:image, profile: user.profile)
      end
    end
  end

  factory :image do
    name 'Test Image'
    file { fixture_file_upload( File.join(Rails.root, 'spec', 'fixtures', 'images', 'cat.jpg'), 'image/jpeg') }
  end
end
