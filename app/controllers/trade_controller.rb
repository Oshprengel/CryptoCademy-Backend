class TradeController < ApplicationController
    ####################### TRADE ROUTE /trade/maketrade ############################ 
    <<-DOC
        trade requests are send in the following json format where the 
        {
            "userName" : "Some username",
            "transaction": "{exchange: {USD: 4000}, for: {ETH:1}}"
        } 
    DOC
    def makeTrade
      #the coin to trade and the amount of it trade
      @coinToTrade = params["trade"]["transaction"]["exchange"][0]
      @amountCoinToTrade = params["trade"]["transaction"]["exchange"][1]

      #the coin to buy and the amount of it to buy
      @coinToBuy = params["trade"]["transaction"]["for"][0]
      @amountCoinToBuy = params["trade"]["transaction"]["for"][1]

      print @coinToTrade.to_s.red, @coinToBuy.to_s.green
      print @amountCoinToTrade.to_s.red, @amountCoinToBuy.to_s.green
      
      #filter through all users
      User.all.each do |currUser|
        #when username matches the one put into params
        if currUser["userName"] == params["trade"]["userName"]
            #we assign the current users porfolio to updated portfolio and then make changes on it
            @updatedPortfolio = currUser["portfolio"]
            @updatedPortfolio[@coinToTrade] -= @amountCoinToTrade
            @updatedPortfolio[@coinToBuy] += @amountCoinToBuy
            #if the user attempts to exchange more of a asset then they have render an error message
            if(@updatedPortfolio[@coinToTrade] < 0)
                render json: {
                    error: "Not enough #{@coinToTrade} for transaction",
                    insufficient: @coinToTrade }
            else
                #update the user
                User.update(currUser["id"],
                :portfolio => @updatedPortfolio)
            end
        end
      end
    end
  end