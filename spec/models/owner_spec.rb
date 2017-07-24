require 'rails_helper'

describe Owner do
  it { should have_many :food_carts }
end
