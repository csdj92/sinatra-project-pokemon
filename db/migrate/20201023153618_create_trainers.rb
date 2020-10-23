class CreateTrainers < ActiveRecord::Migration
  def change
    create_table  :trainers do |t|
      t.string :email
      t.string :trainer_name
      t.string :password_digest
    end
  end
end
