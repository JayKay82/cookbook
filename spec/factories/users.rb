FactoryGirl.define do
  factory :user do
    name 'Jan'
    email 'jan@example.com'
    password 'secretcode'
    password_confirmation 'secretcode'
  end

  trait :confirmed do
    confirmed_at { Time.now }
  end

  trait :admin do
    role 'admin'
  end
end
