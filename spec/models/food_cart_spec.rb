require 'rails_helper'

describe FoodCart do
  it { should belong_to :owner }
  it { should belong_to :location }

end
