class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :phone_number
      t.string :country
      t.string :city
      t.boolean :has_car
      t.integer :family_unit
      t.date :arrival_date
      t.date :departure_date
      t.timestamps null: false
    end
  end
end
