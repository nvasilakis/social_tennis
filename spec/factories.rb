FactoryGirl.define do
  factory :user do
    name  "Example User"
    email "example@user.com"
    password "foobar"
    password_confirmation "foobar"
    dob "12/12/1988"
  end
end
