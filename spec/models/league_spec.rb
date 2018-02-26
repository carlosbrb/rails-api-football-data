require 'rails_helper'

RSpec.describe League, type: :model do
  it "League w/ existing id isn't valid" do
    League.create(league: 'BSF')
    expect(League.new(league: 'BSF')).to be_invalid
  end
end
