class TrainerController < ApplicationController

  get '/trainers' do  
    @trainer = Trainer.all  
    erb :'trainers/index'
  end
  
  get '/trainers/:id' do   
    @trainer = Trainer.find_by_id(params[:id])
      erb :'/trainers/show'    
  end

  
end