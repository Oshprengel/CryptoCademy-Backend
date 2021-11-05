 class HomeController < ApplicationController
  ####################### HOME PAGE / ############################ 
  def home
    render html: "Welcome Home"
  end
end