require 'HTTParty'
require 'Nokogiri'

class Scraper

  attr_accessor :parse_page

  def initialize()

    return scrape("https://www.theguardian.com/environment/2018/jan/16/eu-declares-war-on-plastic-waste-2030")

  end

  def scrape(url)
    @doc = HTTParty.get(url)
    if (url.include? "bbc")
      headline()
    elsif (url.include? "guardian")
      guardian()
    end
  end

  def headline()
    parse_page ||= Nokogiri::HTML(@doc)
    headline = parse_page.css(".story-body__h1")
    p headline.children.text
  end

  def guardian()
    parse_page ||= Nokogiri::HTML(@doc)
    headline = parse_page.css(".content__headline")
    p headline.children.text.gsub("\n",'')
  end

  scraper = Scraper.new
  # p scraper.headline.children.text
  # p the_headline.children.text

end
