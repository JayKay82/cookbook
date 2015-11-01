require 'rails_helper'

RSpec.describe Category, type: :model do
  it { should have_many(:recipe_categories) }
  it { should have_many(:recipes).through(:recipe_categories) }
  it { should validate_presence_of :name }
end
