class StocksController < ApplicationController
    def create
        stock = Stock.new(stock_params)

        if stock.save
            render json: stock, status: :created
        else
            render json: stock.errors, status: :unprocessable_entity
        end
    end

    private 

    def stock_params
        params.require(:stock).permit(:name)
    end
end
