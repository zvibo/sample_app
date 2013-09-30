FactoryGirl.define do
  factory :user do
    name      "Zvi"
    email     "zvi@theidea.net"
    password  "foobar"
    password_confirmation "foobar"
  end
end