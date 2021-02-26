#what do you want your object model to look like 

class Stock

    @@all = []  # here i'm keeping track of my instances 

    attr_accessor :symbol, :companyName, :close, :week52change

    def initilize(symbol, companyName, close, week52change)  # when i create my object instances i want them to have the attributes passed in arg
        @symbol = symbol       
        @companyName = companyName
        @close = close
        @week52change = week52change #stock price 1 year ago
        save
    end


    def save 
        @@all << self
    end 


    def self.all   # this method is used to read the array 
        @@all
    end


    def self.select_stock(ticker_symbol)  #selects the array for matching ticker 
        self.all.find do |stock|
         stock.symbol == ticker_symbol  
        end
    end 

end 