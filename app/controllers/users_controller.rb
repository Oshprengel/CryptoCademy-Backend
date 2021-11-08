class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]
  
 ####################### CREATE USER /users/create############################ 

  def createUserAttempt
    #if username is not already taken
    if !checkUser params["userName"]
      #create new user
      @newUser = User.new(
        userName:params["userName"],
        password:params["password"],
        portfolio: {
              USD: 5000, 
              BTC: 0,
              ETH: 0,
              DOGE:  0,
              ADA: 0,
              DOT: 0,
            }
        )
      #if user is created then render a json object with that users info
      if @newUser.save
        render json: @newUser
      #otherwise send error message 
      else 
        render json: {"error":"Unable to create new user"}
      end
    #if username is already taken then send error message 
    else
      render json: {"error":"Username is already taken!"}
    end
  end


    #checks to see if user already exists
  def checkUser(userName)
    @users = User.all
    @users.each do |user|
      if user["userName"] == userName
        return user
      end
    end
    return false
  end

 ##############################################################################

 ####################### LOGIN CHECK /users/login ############################

  def loginCheck
    #if username exist render the login user info
    if checkForUser(params)
        render json: checkForUser(params)
    #if username doesnt exist or match 
    else
      render json: {"error":"Username/Password does not match or exist!"}
    end
  end


    #checks to see if user exists in database
    def checkForUser(loginUser)
      @users = User.all

      @users.each do |user|
        if user["userName"] == loginUser["userName"] && user["password"] == loginUser["password"]
          return user
        end
      end
      return false

    end
 ##############################################################################

end
