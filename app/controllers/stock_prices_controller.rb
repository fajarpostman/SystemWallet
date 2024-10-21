class StockPricesController < ApplicationController

    def price
        search = params[:search]  
        result = LatestStockPrice.price(search) 
        render json: result.parsed_response 
    end
  
    def prices
        symbols = params[:symbols]
        result = LatestStockPrice.prices(symbols)
        render json: result.parsed_response
    end
  
    def price_all
      result = LatestStockPrice.price_all
      render json: result.parsed_response
    end
end
  