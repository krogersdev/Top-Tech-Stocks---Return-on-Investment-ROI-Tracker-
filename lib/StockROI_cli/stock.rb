class Stock

    @@all = []  

    attr_reader :symbol, :companyName, :latestPrice, :week52change, :latestTime

    def initialize(stockobj)  
        @symbol = stockobj[0]
        @companyName = stockobj[1].dig("stats","companyName")
        @latestPrice = stockobj[1].dig("quote","latestPrice")   
        @week52change = stockobj[1].dig("stats","week52change")
        @latestTime = stockobj[1].dig("quote","latestTime")
        save
    end
        
    def save 
        @@all << self
    end 
        
    def self.all   
        @@all
    end

end 

