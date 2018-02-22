Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/import-league/:id' => 'leagues#import'
  get '/total-players/:id' => 'leagues#total_players'
end
