require "rails_helper"

describe Message do
  it { should have_many :replies }
end
