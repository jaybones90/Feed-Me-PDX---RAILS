require "rails_helper"

describe Message do
  it { should belong_to :subscriber }
  it { should have_many :replies }
end
