require 'httparty'

class LatestStockPrice
  include HTTParty
  base_uri 'https://latest-stock-price.p.rapidapi.com'

  def self.price(symbol)
    get("/price", headers: headers, query: { symbol: symbol })
  end

  def self.prices(symbols)
    get("/prices", headers: headers, query: { symbols: symbols })
  end

  def self.price_all
    get("/price_all", headers: headers)
  end

  def self.headers
    {
      'x-rapidapi-host' => 'latest-stock-price.p.rapidapi.com',
      'x-rapidapi-key' => ENV['7dbb2caffdmsheffa95bf930ffd5p1762c5jsn0655c580c46b'], # Use environment variable for security
      'Content-Type' => 'application/json'
    }
  end
end
