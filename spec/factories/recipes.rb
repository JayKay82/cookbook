FactoryGirl.define do
  factory :recipe do
    title "French Onion"
    description "This is a classic onion soup."
    cooking_steps "Heat oil in pan. Add some onions."
    prep_time 15
    cooking_time 100
    user user
  end

end
