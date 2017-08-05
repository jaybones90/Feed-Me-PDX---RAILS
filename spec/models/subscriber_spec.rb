require 'rails_helper'

describe Subscriber do
  it { should have_many :messages }
end
