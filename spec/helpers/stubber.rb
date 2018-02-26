def stub_footballorg_request
  stub_request(:get, 'http://api.football-data.org/v1/competitions').
     with( headers: {
      'Accept'=>'*/*','Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
      'User-Agent'=>'Faraday v0.14.0',
      'X-Auth-Token'=>'e7555372c6834a2a8bb54810bdaa6d28',
      'X-Response-Control'=>'minified'
       }).to_return(status: 200, body: '[{"id":444,"caption":"Campeonato Brasileiro da Série A","league":"BSA","year":"2017"}]')
end

def stub_network_error
  stub_request(:get, 'http://api.football-data.org/v1/competitions').
    with( headers: {
     'Accept'=>'*/*','Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
     'User-Agent'=>'Faraday v0.14.0',
     'X-Auth-Token'=>'e7555372c6834a2a8bb54810bdaa6d28',
     'X-Response-Control'=>'minified'
      }).to_timeout
end

def stub_teams
  stub_request(:get, "http://api.football-data.org/v1/competitions/444/teams").
         with(  headers: {
          'Accept'=>'*/*',
          'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'User-Agent'=>'Faraday v0.14.0',
          'X-Auth-Token'=>'e7555372c6834a2a8bb54810bdaa6d28',
          'X-Response-Control'=>'minified'
           }).
         to_return(status: 200, body: '{"teams":[{"_links":{"self":{"href":"http://api.football-data.org/v1/teams/1783"},"fixtures":{"href":"http://api.football-data.org/v1/teams/1783/fixtures"},"players":{"href":"http://api.football-data.org/v1/teams/1783/players"}},"name":"EC Flamengo","code":null,"shortName":"Flamengo","squadMarketValue":null,"crestUrl":null}]}', headers: {})
end

def stub_team
  stub_request(:get, "http://api.football-data.org/v1/teams").
         with(  headers: {
          'Accept'=>'*/*',
          'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'User-Agent'=>'Faraday v0.14.0',
          'X-Auth-Token'=>'e7555372c6834a2a8bb54810bdaa6d28',
          'X-Response-Control'=>'minified'
           }).
         to_return(status: 200, body: '{"error":"The resource you are looking for does not exist."}', headers: {})
end

def stub_all_requests
  stub_footballorg_request
  stub_teams
  stub_team
end
