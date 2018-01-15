FactoryGirl.define do
  factory :user do
    email "johndoe@hotmail.com"
    fullname "John Doe"
    role 1
    password "johndoe123"
    password_confirmation "johndoe123"
  end
end
