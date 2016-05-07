class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.jsonb :marker, null: false
    end

    add_reference :places, :user, index: true, foreign_key: true

  end
end
