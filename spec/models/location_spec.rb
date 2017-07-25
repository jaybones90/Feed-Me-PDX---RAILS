require 'rails_helper'

describe Location do
  it { should belong_to :food_cart }
end
