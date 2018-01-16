require 'HTTParty'
require 'Nokogiri'

class Scraper

  attr_accessor :parse_page

  def initialize()

    return scrape("https://www.creditstrategy.co.uk/news/news-top-stories/watchdog-to-review-smart-meter-roll-out-this-summer-4323")

  end

  def scrape(url)
    @doc = HTTParty.get(url)
    if (url.include? "bbc.co.uk")
      bbc()
    elsif (url.include? "guardian.com")
      guardian()
    elsif (url.include? "independent.co.uk")
      independent()
    elsif (url.include? "times.co.uk")
      times()
    elsif (url.include? "telegraph.co.uk")
      telegraph()
    elsif (url.include? "thisismoney.co.uk")
      this_is_money()
    elsif (url.include? "sun.co.uk")
      sun_money()
    elsif (url.include? "mirror.co.uk")
      mirror_money()
    elsif (url.include? "creditstrategy.co.uk")
      credit_strategy()
    elsif (url.include? "creditconnect.co.uk")
      credit_connect()
    elsif (url.include? "reuters.co.uk")
      reuters()

    end
  end

  def bbc()
    parse_page ||= Nokogiri::HTML(@doc)
    headline = parse_page.css(".story-body__h1")
    p headline.children.text
  end

  def guardian()
    parse_page ||= Nokogiri::HTML(@doc)
    headline = parse_page.css(".content__headline")
    p headline.children.text.gsub("\n",'')
  end

  def independent()
    parse_page ||= Nokogiri::HTML(@doc)
    headline = parse_page.css("h1[itemprop='headline']")
    p headline.children.text
  end

  def times()
    parse_page ||= Nokogiri::HTML(@doc)
    headline = parse_page.css("h1[class='Article-headline Headline Headline--article']")
    p headline.children.text
  end

  def telegraph()
    parse_page ||= Nokogiri::HTML(@doc)
    headline = parse_page.css(".headline__heading")
    p headline.children.text.gsub("\n",'')
  end

  def this_is_money()
    parse_page ||= Nokogiri::HTML(@doc)
    headline = parse_page.css("h1")
    p headline.children.text
  end

  def sun_money()
    parse_page ||= Nokogiri::HTML(@doc)
    headline = parse_page.css(".article__headline")
    p headline.children.text
  end

  def mirror_money()
    parse_page ||= Nokogiri::HTML(@doc)
    headline = parse_page.css("h1[itemprop='headline name']")
    p headline.children.text
  end

  def credit_strategy()
    parse_page ||= Nokogiri::HTML(@doc)
    headline = parse_page.css("h1[class='aos-ArticleTitle aos-DS72-H1 aos-MBXS5']")
    p headline.children.text
  end

  def credit_strategy()
    parse_page ||= Nokogiri::HTML(@doc)
    headline = parse_page.css("h1[class='aos-ArticleTitle aos-DS72-H1 aos-MBXS5']")
    p headline.children.text
  end


  scraper = Scraper.new

end
