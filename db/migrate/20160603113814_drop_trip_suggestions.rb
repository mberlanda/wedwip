class DropTripSuggestions < ActiveRecord::Migration
  def change
    drop_table :trip_suggestions
  end
end
