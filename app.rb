require('sinatra')
require('sinatra/contrib/all')

require_relative('./models/scraper')

get '/' do
  @scraper_util = Scraper.new
  erb ( :home )
end

post '/results' do
  @scraper_util = Scraper.new
  @submitted_urls = params['urls'].split(', ')
  @submitted_urls.each do |news_item|
    @scraper_util.scrape(news_item)
  end


  erb ( :results )
end
