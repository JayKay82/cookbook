require 'rails_helper'

RSpec.describe Recipe, type: :model do
  it { should belong_to :user }
  it { should validate_presence_of :title }
  it { should validate_length_of(:title).is_at_least(2).is_at_most(20) }
  it { should validate_presence_of :description }
  it { should validate_length_of(:description).is_at_most(140) }
  it { should validate_presence_of :cooking_steps }
  it { should validate_presence_of :prep_time }
  it { should validate_presence_of :cooking_time }
  # it { should validate_numericality_of(:prep_time).only_integer }
  # it { should validate_numericality_of(:cooking_time).only_integer }
end
