require 'HTTParty'
require 'Nokogiri'

class Scraper

  attr_accessor :parse_page

  def initialize()

    url_array = ["http://www.bbc.co.uk/news/business-42703549", "http://www.eveningtimes.co.uk/news/15837175.Heavy_snow_hits_Glasgow_roads_and_schools_as_Met_Office_upgrades_weather_warning_to_amber/"]

    return scrape(url_array)

  end

  def scrape(url_array)
    for url in url_array
      @doc = HTTParty.get(url)
      if (url.include? "bbc.co.uk")
        produce_url(url, ".story-body__h1", "(BBC News)")
      elsif (url.include? "guardian.com")
        guardian()
      elsif (url.include? "independent.co.uk")
        independent()
      elsif (url.include? "eveningtimes.co.uk")
        evening_times()
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
      elsif (url.include? "credit-connect.co.uk")
        credit_connect()
      elsif (url.include? "reuters.com")
        reuters()
      elsif (url.include? "dailyrecord.co.uk")
        daily_record()
      elsif (url.include? "heraldscotland.com")
        herald()
      elsif (url.include? "scotsman.com")
        scotsman()
      end
    end
  end

  def produce_url(url, css, news_org)
    parse_page ||= Nokogiri::HTML(@doc)
    headline = parse_page.css(css)
    my_url_object = {
      "content": headline.children.text,
      "news_org": news_org,
      "url": url
    }
    p my_url_object
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

  def credit_connect()
    parse_page ||= Nokogiri::HTML(@doc)
    headline = parse_page.css("h1[class='entry-title entry-title--in-cover']")
    p headline.children.text
  end

  def reuters()
    parse_page ||= Nokogiri::HTML(@doc)
    headline = parse_page.css(".ArticleHeader_headline_2zdFM")
    p headline.children.text
  end

  def daily_record()
    parse_page ||= Nokogiri::HTML(@doc)
    headline = parse_page.css("h1[itemprop='headline name']")
    p headline.children.text
  end

  def herald()
    parse_page ||= Nokogiri::HTML(@doc)
    headline = parse_page.css("h1[class='headline semi-loud']")
    p headline.children.text
  end

  def scotsman()
    parse_page ||= Nokogiri::HTML(@doc)
    headline = parse_page.css(".article-header__title")
    p headline.children.text
  end

  def evening_times()
    parse_page ||= Nokogiri::HTML(@doc)
    headline = parse_page.css("h1[class='headline semi-loud']")
    p headline.children.text
  end

  scraper = Scraper.new

end
