class PokemonController < ApplicationController

    get "/pokemon" do 
        authenticate
        @pokemon = Pokemon.all
        erb :'pokemon/index'
    end

    get "/pokemon/new" do 
        authenticate
        erb :'pokemon/new'
    end
    
end