require 'rails_helper'

describe Location do
  it { should have_one :food_cart }
end
