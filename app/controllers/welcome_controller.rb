class WelcomeController < ApplicationController
before_action :authenticate_user!
before_action :authorized_user, only: [:show]
  def index
  	@articles = Article.all
     	
  end
end
