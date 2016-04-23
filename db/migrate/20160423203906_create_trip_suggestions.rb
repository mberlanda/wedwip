class CreateTripSuggestions < ActiveRecord::Migration
  def change
    create_table :trip_suggestions do |t|
      t.string :name, null: false
      t.string :title, null: false
      t.text :message, null: false
      t.timestamps
    end

    add_reference :trip_suggestions, :user, index: true, foreign_key: true

  end
end
