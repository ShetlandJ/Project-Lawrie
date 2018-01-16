require 'HTTParty'
require 'Nokogiri'

class Scraper

  attr_accessor :parse_page

  def initialize()

    doc = HTTParty.get("http://www.bbc.co.uk/news/business-42703549")
    @parse_page ||= Nokogiri::HTML(doc)

  end

  def headline
    headline = parse_page.css(".story-body__h1").children
    # .map { |name| name.text  }.compact
  end

  scraper = Scraper.new
  the_headline = scraper.headline
  p the_headline

end
