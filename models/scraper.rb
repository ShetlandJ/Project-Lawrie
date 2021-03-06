require 'httparty'
require 'nokogiri'

class Scraper

  attr_accessor :parse_page

  def initialize()

    @submitted_urls = []
    @irish_urls = []
    @news_organisations = ["BBC", "Guardian", "Independent", "Evening Times", "The Times", "This Is Money", "The Sun", "Mirror", "Credit Strategy", "Credit Connect", "Reuters", "Daily Record", "Herald", "Scotsman", "Irish Times", "Irish Independent", "Irish Examiner", "RTE"]

  end

  def scrape(url)
    @doc = HTTParty.get(url)
    if (url.include? "bbc.co.uk")
      produce_url(url, "h1", "(BBC News)")
    elsif (url.include? "guardian.com")
      produce_url_gsub(url, "h1", "(Guardian)")
    elsif (url.include? "independent.co.uk")
      produce_url(url, "h1", "(The Independent)")
    elsif (url.include? "eveningtimes.co.uk")
      produce_url(url, "h1", "(Evening Times)")
    elsif (url.include? "times.co.uk")
      produce_url(url, "h1", "(The Times)")
    elsif (url.include? "telegraph.co.uk")
      produce_url_gsub(url, "h1", "(The Telegraph)")
    elsif (url.include? "thisismoney.co.uk")
      produce_url(url, "h1", "(This Is Money)")
    elsif (url.include? "sun.co.uk")
      produce_url(url, "h1", "(The Sun)")
    elsif (url.include? "mirror.co.uk")
      produce_url(url, "h1", "(The Mirror)")
    elsif (url.include? "creditstrategy.co.uk")
      produce_url(url, "h1", "(Credit Strategy)")
    elsif (url.include? "credit-connect.co.uk")
      produce_url(url, "h1", "(Credit Connect)")
    elsif (url.include? "reuters.com")
      produce_url(url, "h1", "(Reuters)")
    elsif (url.include? "dailyrecord.co.uk")
      produce_url(url, "h1", "(Daily Record)")
    elsif (url.include? "heraldscotland.com")
      produce_url(url, "h1", "(The Herald)")
    elsif (url.include? "scotsman.com")
      produce_url(url, "h1", "(The Scotsman)")
    elsif (url.include? "irishtimes.com")
      produce_irish_url(url, "h1", "(Irish Times)")
    elsif (url.include? "independent.ie")
      produce_irish_url(url, "h1", "(Irish Independent)")
    elsif (url.include? "irishexaminer.com")
      produce_irish_url(url, "h1", "(Irish Examiner)")
    elsif (url.include? "rte.ie")
      produce_irish_url(url, "h1", "(RTE)")
    else
      produce_url_unlisted(url)
    end
  end

# RTE

  def produce_url(url, css, news_org)
    parse_page ||= Nokogiri::HTML(@doc)
    headline = parse_page.css(css)
    my_url_object = {
      "content": headline.children.text,
      "news_org": news_org,
      "url": url
    }
    @submitted_urls.push(my_url_object)
  end

  def produce_irish_url(url, css, news_org)
    parse_page ||= Nokogiri::HTML(@doc)
    headline = parse_page.css(css)
    my_url_object = {
      "content": headline.children.text,
      "news_org": news_org,
      "url": url
    }
    @irish_urls.push(my_url_object)
  end

  def produce_url_gsub(url, css, news_org)
    parse_page ||= Nokogiri::HTML(@doc)
    headline = parse_page.css(css)
    my_url_object = {
      "content": headline.children.text.gsub("\n", ''),
      "news_org": news_org,
      "url": url
    }
    @submitted_urls.push(my_url_object)
  end

  def produce_url_unlisted(url)
    my_url_object = {
      "content": "Sorry, but we don't have that organisation on record, or the link you supplied did not work. ERROR URL: (#{url})",
      "news_org": "",
      "url": ""
    }
    @submitted_urls.push(my_url_object)
  end


  def return_urls()
    return @submitted_urls
  end

  def alphabetise(arr, rev=false)
    if rev
      arr.sort.reverse
    else
      arr.sort
    end
  end

  def return_orgs()
    return alphabetise(@news_organisations, false)
  end

  def return_irish_urls()
    return @irish_urls
  end


  def add_url_list_to_submitted_urls(submitted_url)
    @submitted_url.push(submitted_url)
  end

  scraper = Scraper.new

end
