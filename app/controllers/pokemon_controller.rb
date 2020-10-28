class PokemonController < ApplicationController

    get "/pokemon" do        
        !authenticate
        @pokemon = Pokemon.all
        erb :'pokemon/index'
    end

    get "/pokemon/new" do 
      !authenticate       
        erb :'pokemon/new'
    end

    post "/pokemon" do  
      !authenticate     
        @pokemon = Pokemon.create(name: params[:name], types: params[:types], nickname: params[:nickname])
        if @pokemon.valid?
            current_user.pokemon << @pokemon
            redirect "/trainers/#{current_user.id}"
        else            
            erb :"pokemon/new"
        end
    end

    get '/pokemon/:id' do  
      !authenticate           
        @pokemon = Pokemon.find_by_id(params[:id])
          erb :'pokemon/show'      
      end
    
      get '/pokemon/:id/edit' do 
        !authenticate             
         @pokemon = Pokemon.find_by_id(params[:id])
           @pokemon.trainer.id == current_user.id
              erb :'pokemon/edit'
           end
    
      patch '/pokemon/:id' do 
        !authenticate               
        if @pokemon = Pokemon.find_by_id(params[:id])
          if @pokemon.trainer.id == current_user.id
      
              if params[:name] != ""
                @pokemon.name = params[:name]
              end
      
              if params[:nickname] != ""
                @pokemon.nickname = params[:nickname]
              end
      
              if params[:types] != ""
                @pokemon.types = params[:types]
              end
      
              if @pokemon.valid?              
                @pokemon.save
                redirect "pokemon/#{@pokemon.id}"
              else                
                erb :'pokemon/edit'
              end          
          end        
        end
      end
    
      delete "/pokemon/:id" do   
        !authenticate          
        if @pokemon = Pokemon.find_by_id(params[:id])
          if @pokemon.trainer.id == current_user.id
              @pokemon.delete
              redirect '/pokemon'
          else 
              redirect "/pokemon/#{@pokemon.id}"
          end       
        end
      end
    
end