require 'json'
require 'pry'
require "httparty"

class API
    
    def self.api_getinfo #this methos is getting the information from the API 
        url = "https://sandbox.iexapis.com/stable/stock/market/batch?symbols=fb,aapl,msft,amzn,goog,intc,csco,nflx&types=quote,stats&range=1y&token=Tpk_ca9c752562b2483e9d50eed598141a52&filter=symbol,companyName,close,week52change" #Now Current URL     # gives us CompanyName & week52change
        response = HTTParty.get(url)
        self.createstock(response)

    end 

    def self.createstock(response)
        new_stock = Stock.new_stock
        # (response["symbol"], response["companyName"],response["close"],response["week52change"])
      
    end 


end 