require('sinatra')
require('sinatra/contrib/all')

require_relative('./models/scraper')

get '/' do
  @scraper_util = Scraper.new
  erb ( :home )
end
