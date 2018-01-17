require('sinatra')
require('sinatra/contrib/all')

require_relative('./models/scraper')

get '/' do
  @scraper_util = Scraper.new
  erb ( :home )
end

post '/results' do
  @scraper_util = Scraper.new
  @users_urls = params['urls']
end
