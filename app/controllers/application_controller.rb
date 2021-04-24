require './config/environment'

class ApplicationController < Sinatra::Base

  #MAKE SURE TO ADD LINKS THROUGH THE VIEWS

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    ## gives acccess to patch/put and delete
    set :method_override, true
    enable :sessions 
    set :session_secret, "Enter Cheatcode/Password"
  end

  #gets is route
  #erb looking for files
  get "/" do
    erb :welcome
  end

# #testing flash
#   get '/' do
#     flash[:notice] = "Hooray, Flash is working!"
#     erb :index
#   end
# #testing flash




  helpers do
    def current_user
      @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end

    def logged_in?
      !!current_user
    end

    end
end

