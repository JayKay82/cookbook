require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many :recipes }
  it { should validate_presence_of(:name) }
  it { should validate_length_of(:name).is_at_most(15) }
end
