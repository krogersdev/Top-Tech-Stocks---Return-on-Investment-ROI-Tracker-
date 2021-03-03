class CLI

    def start 
        puts "Hello Investor, welcome to the Top Tech stock Return on Investment (ROI) Tracker\n\n"
        puts "Have you ever wondered? What if I'd purchased that popular Tech stock a year ago, would I have made a profit or loss.?\n\n" 
        puts "Our Tracker allows you to see this hypothetical, when you select one of the top technology stocks in the Market.\n\n"
        puts "Type 'y'  and press 'enter' to see these Tech stocks, or 'exit' to leave the app!\n\n"
        puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
        API.new.get_data
        menu
    end 

    def user_input
        gets.chomp.downcase
    end 

    def menu   
        selection = user_input
        if selection == 'y'
            stock_list
            menu
        elsif selection.to_i < 11 && selection.to_i > 0 && selection =~ [/^\d+$/]
            stock_details(selection)
            puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
            puts "If you would like to see another stock, select the corresponding number  or 'exit' at anytime to leave the app!"
            menu
        elsif selection == 'exit'
            exit_app
        else
            invalid_entry
        end
    end 
    
    def stock_list     #prints list of stocks 
            puts "Which Tech stock would you like to lookup?."
            puts ""
            Stock.all.each.with_index(1) do |stock, i|
            puts "#{i}. #{stock.companyName}" + "  " +  "(#{stock.symbol})"
        end
            puts "Select a number to see the corresponding stock details\n\n"  
            puts "(e.g. type '2' for Apple Inc  (AAPL) and press 'enter'!\n\n"
    end 

    def stock_details(input)
            stock = Stock.all[input.to_i-1]
            percentage = stock.week52change.round(2)
            lastyearprice = stock.latestPrice / (1+ percentage)
            puts "Ticker:""(#{stock.symbol})"
            puts "Company Name:" "#{stock.companyName}"
            puts "Date:""#{stock.latestTime}"
            puts "Latest Price:" + "$" "#{stock.latestPrice}"
            puts "last year's Price:" + "$" "#{lastyearprice.round(2)}"
            puts "One-year-to-date percentage change:" +  "#{percentage.*100}%" 
            percentage > 0.01 ? (puts"you would have made a profit!") :(puts "you would have made a loss!")  
    end 

    def exit_app
            puts "Until next time"
            exit
    end 

    def invalid_entry
            puts "Invalid entry. Type 'y' to continue or 'exit' to quit!"
        menu 
    end
end   

       
    
    