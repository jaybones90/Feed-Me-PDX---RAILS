require "rails_helper"

describe Reply do
  it { should belong_to :message }
end
