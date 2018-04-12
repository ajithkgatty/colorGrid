class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception



  def generate_random_user
  	p "im in application controller"
  	ids = User.pluck(:id)
  	session[:user_id] = ids.sample
  	session[:username] = User.where(id: session[:user_id]).first.username
  end
end
