class CreatePokemon < ActiveRecord::Migration
  def change
    create_table :pokemons do |t|
      t.string :name
      t.string :types
      t.integer :trainer_id
      t.string :nickname
    end
  end
end
