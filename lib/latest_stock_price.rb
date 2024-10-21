require 'httparty'

class LatestStockPrice
  include HTTParty
  base_uri 'https://latest-stock-price.p.rapidapi.com'

  def self.price(search)
    get("/equities-search", headers: headers, query: { Search: search })
  end

  def self.prices(symbols)
    get("/equities-enhanced", headers: headers, query: { Symbols: symbols })
  end

  def self.price_all
    get("/equities", headers: headers)
  end

  def self.headers
    {
      'x-rapidapi-host' => 'latest-stock-price.p.rapidapi.com',
      'x-rapidapi-key' => '8bbf3063e0msh70e433541a25255p1fbdf8jsn7dbb4d25ce6a', 
      'Content-Type' => 'application/json'
    }
  end
end
