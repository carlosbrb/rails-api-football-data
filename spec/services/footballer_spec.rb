require 'rails_helper'
RSpec.describe Footballer do
  before(:each) do
    stub_all_requests
  end

  describe "Find leagues" do
    it "initializes with data" do
      expect(Footballer.new.competitions).not_to be_empty
    end

    it "Gets the league data" do
      expect(Footballer.new.find_league('BSA')).not_to be_empty
    end

    it "Gets empty array when no data" do
      expect(Footballer.new.find_league('CLD')).to be_eql([])
    end
  end

  describe "League teams" do
    it "Gets the team data" do
      expect(Footballer.new.league_teams('BSA')).not_to be_empty
    end

    it "Gets empty array when no data" do
      expect(Footballer.new.league_teams('CLD')).to be_eql([])
    end
  end

end
