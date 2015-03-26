class CreateUsers < ActiveRecord::Migration
  def change

    #this is a method create table, and we're passing in the user symbol as a parameter along with this anonymous function

    create_table :users do |t|
      t.string :name
      t.string :email

      t.timestamps null: false
    end
  end
end
