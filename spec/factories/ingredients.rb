FactoryGirl.define do
  factory :ingredient do
    name "onion"
    quantity "8"
    prep_method "chopped"
    recipe recipe
  end

end
