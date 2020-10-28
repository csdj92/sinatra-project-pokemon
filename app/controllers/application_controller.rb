require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "321864651321651216541641321"
  end


    get "/" do
        erb :welcome
    end

  helpers do

    def logged_in?
      !!session[:user_id]
    end  
    
   def current_user
    Trainer.find_by_id(session[:user_id])
    end 
    
    def authenticate
      if !logged_in?
        redirect '/login'
      end
    end

  end
end
