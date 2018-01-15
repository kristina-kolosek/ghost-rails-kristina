FactoryGirl.define do
  factory :profile do
    fullname "John Doe"
    role Profile::ADMIN
    user
  end
end
