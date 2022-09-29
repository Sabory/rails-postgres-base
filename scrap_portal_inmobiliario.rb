# frozen_string_literal: true

price_range = [100, 6500]
bedroom_range = [1, 4]
bathroom_range = [1, 4]
parking_lot_range = [1, 4]
area_range = [60, 300]
state_code = 'providencia-metropolitana'

PORTAL_INMOBILIARIO_BASE_URL = "https://www.portalinmobiliario.com/venta/departamento/#{state_code}/_Desde_51_PriceRange_#{price_range[0]}CLF-#{price_range[1]}CLF_BEDROOMS_#{bedroom_range[0]}-#{bedroom_range[1]}_FULL*BATHROOMS_#{bathroom_range[0]}-#{bathroom_range[1]}_NoIndex_True_PARKING*LOTS_#{parking_lot_range[0]}-#{parking_lot_range[1]}_TOTAL*AREA_#{area_range[0]}-#{area_range[1]}"

def generate_page_url(page_number)
  if page_number == 1
    return PORTAL_INMOBILIARIO_BASE_URL.replace('_Desde_51', "")
  end

  page_listing_floor = ((page_number - 1) * 50) + 1

  PORTAL_INMOBILIARIO_BASE_URL.replace('_Desde_51', "_Desde_#{page_listing_floor}")
end

# response = HTTParty.get(PORTAL_INMOBILIARIO_BASE_URL)

# puts response.body response.code, response.message, response.headers.inspect

#  html = response.body

class Listing
  attr_reader :price_capital, :area, :location, :description

  def initialize(price_capital:, area:, location:, description:, url:, bedrooms:)
    @price_capital = price_capital
    @area = area
    @location = location
    @description = description
    @url = url
    @bedrooms = bedrooms
  end
end

class ListingParser
  attr_reader :listing

  def initialize(parser:, xml:)
    @parser = parser
    @xml = xml

    @price_capital = scrape_capital
    @area = scrape_area
    @location = scrape_location
    @description = scrape_description
    @url = scrape_url
    @bedrooms = scrape_bedrooms

    @listing ||= generate_listing
  end

  private

  def scrape_capital
    Money.new(amount: scrape_amount, currency: scrape_currency)
  end

  def scrape_area
    Area.new(*scrape_area_amount)
  end

  def scrape_amount
    @xml.at(@parser[:price]).text.delete(".").to_i
  end

  def scrape_currency
    @xml.at(@parser[:currency]).text
  end

  def scrape_location
    @xml.css(@parser[:location]).first.text.gsub(/\n\s+/, " ")
  end

  def scrape_description
    @xml.css(@parser[:description]).last.text.gsub(/\n\s+/, " ")
  end

  def generate_listing
    Listing.new(
      price_capital: @price_capital,
      area: @area,
      location: @location,
      description: @description,
      url: @url,
      bedrooms: @bedrooms
    )
  end

  def scrape_bedrooms
    get_area_and_bedrooms.last.split.first.to_i
  end

  def scrape_area_amount
    text_splited = get_area_and_bedrooms.first.text.split

    { area: text_splited.first, unit: text_splited[1] }
  end

  def scrape_url
    @xml.at(@parser[:url])["href"]
  end

  def get_area_and_bedrooms
    @xml.css(@parser[:area_and_rooms])
  end
end

class PortalInmobiliario
  PARSER = {
    listings: "li.ui-search-layout__item.shops__layout-item",
    listing: {
      price: "span.price-tag-fraction",
      currency: "span.price-tag-symbol",
      area_and_rooms: "ul.ui-search-card-attributes li",
      location: "p.ui-search-item__location",
      description: "p.ui-search-item__information",
      url: "a.ui-search-link"
    }
  }

  attr_reader :listings

  def initialize(doc:)
    @doc = doc

    @listings ||= scrape_page
  end

  def scrape_page
    listings = @doc.css(PARSER[:listings])

    listings.map do |listing|
      ListingParser.new(parser: PARSER[:listing], xml: listing).listing
    end
  end
end

html = File.read('./test/portal_inmobiliario.html')

doc = Nokogiri::HTML5(html)

listings = PortalInmobiliario.new(doc: doc).listings

puts listings.length
