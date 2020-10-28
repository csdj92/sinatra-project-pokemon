class SessionsController < ApplicationController

  get '/login' do
    if !logged_in?
      @failed = false
      erb :'sessions/login'
    else
      redirect "/trainers"
    end
  end

  post '/login' do   
    @trainer = Trainer.find_by(trainer_name: params[:trainer_name])
       if @trainer && @trainer.authenticate(params[:password])
      session[:user_id] = @trainer.id
      redirect "/trainers"
    else
      @failed = true
      erb :'sessions/login'
    end
  end

  get '/signup' do
    if logged_in?
      redirect "/trainers"
    else
      erb :'sessions/signup'
    end
  end


  post '/signup' do    
    @trainer = Trainer.create(trainer_name: params[:trainer_name], password: params[:password], password_confirmation: params[:password_confirmation], email: params[:email])
    if @trainer.valid?      
      session[:user_id] = @trainer.id
      redirect "/trainers"
    else
      @failed = true
      erb :'sessions/signup'
    end
  end

  get '/logout' do
    !authenticate
      session.clear
      redirect '/login'
  end


 
end