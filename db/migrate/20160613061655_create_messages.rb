class CreateMessages < ActiveRecord::Migration
  def change

    create_table :messages do |t|
      t.text :text
      t.timestamps null: false
    end

    add_reference :messages, :user, index: true, foreign_key: true

  end
end
