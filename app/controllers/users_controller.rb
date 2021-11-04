class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]

  def createUserAttempt
    @body = request.body
    puts @body
    render json: @bod
#HERE A SMALL CHANGE
  end
end