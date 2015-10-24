FactoryGirl.define do
  factory :user do
    name 'Jan'
    email 'jan@example.com'
    password 'secretcode'
    password_confirmation 'secretcode'
  end
end
