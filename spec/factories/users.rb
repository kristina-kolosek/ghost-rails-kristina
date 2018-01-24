FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "person#{n}@example.com" }
    password "johndoe123"
    password_confirmation "johndoe123"
    after(:build) do |user|
      user.profile ||= FactoryGirl.build(:profile, user: user)
    end
  end
end
