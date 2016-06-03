class Place  < ActiveRecord::Base
end

class AddReasonToPlace < ActiveRecord::Migration
  def change
    change_table :places do |t|
      t.string :address
      t.text :reason
    end
  end
end
