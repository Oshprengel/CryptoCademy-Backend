class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]

  def createUserAttempt
    @body = request.body
    puts @body
    render json: @body
  end
end