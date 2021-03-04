

class API

    def initialize    #here i brought in the webpage 
        @url = "https://sandbox.iexapis.com/stable/stock/market/batch?symbols=fb,aapl,msft,amzn,goog,intc,csco,nvda,adbe,crm&types=quote,stats&range=1y&token=Tpk_ca9c752562b2483e9d50eed598141a52&filter=symbol,companyName,latestPrice,week52change,latestTime"
    end  

    def get_data    
        stock_hash = HTTParty.get(@url)
        stock_hash.each do |stockobj|
            Stock.new(stockobj)
            end 
        end
    end  