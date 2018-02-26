class Responder
  def initialize(league_id)
    @league_id = league_id
  end

  def process_league
    begin
      return { message: '{"message": "Not found"}', status: 404 } if not_found?
      return { message: '{"message": "League already imported"}', status: 409 } if already_imported?
      return { message: '{"message": "Successfully imported"}', status: 201 } if imported_successfully?
    rescue Faraday::ConnectionFailed
      return { message: '{"message": "Server Error"}', status: 504 }
    end
  end

  def process_totals
    league = League.find_by_league(@league_id)
    if league.blank?
      { message: '', status: 404 }
    else
      { message: "{'total': #{league.players.count}}", status: 200 }
    end
  end

  def not_found?
    Footballer.new.find_league(@league_id).blank?
  end

  def already_imported?
    !League.find_by_league(@league_id).blank?
  end

  def imported_successfully?
    League.import(@league_id, Footballer.new)
  end
end
