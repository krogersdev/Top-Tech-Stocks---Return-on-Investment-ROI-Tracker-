#responsible for communicating between the user and data 


class CLI

    #method to behave as entry point to CLI 
    def start 
        puts "Hello Investor, welcome to the Return on Investment (ROI) calculator"
        puts ""
        puts "Have you ever wondered? What if i'd purchased that popular stock a year ago, would i have made a profit or loss .?" 
        puts ""
        puts "Our calculator allows you to test this hypothetical for the top technology stocks by Market capitalization "
        puts ""
        puts "Type 'y'  and press 'enter' to see these top stocks, or 'exit' to leave the app!"
        puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
        menu
    end 

    
    def user_input
        gets.chomp.downcase      #method created to assign user input
    end 
  

    def stock_lookup 
        stock = Stock.select_stock(selection)

         #if  

            # after calling stock_lockup --> options are Exit or another selection 
         
               
        # puts " enter 'y' to try another ticker"
        menu
    end 
    
    
    def some_other_time
        puts "until next time"
    end 


    def invalid_entry
        puts "Invalid entry. Please try again"
        menu
    end
    

    # def stock_list
    #     array = 

    # end 
    
    
    def menu      # method gives the options based on user selection
        selection = user_input

        if selection == 'y'
            puts "Which stock ticker would you like to lookup?."
            puts ""
            puts "Type a ticker symbol (e.g. 'AAPL' for Apple Inc) and press 'enter'!"
            stock_lookup    
                             
        elsif selection == 'exit'
             some_other_time                  
        
        else
            invalid_entry
        end 
               
           
    end 

    

end 