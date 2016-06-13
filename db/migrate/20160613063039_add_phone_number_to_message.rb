class AddPhoneNumberToMessage < ActiveRecord::Migration
  def change
    change_table :messages do |t|
      t.string :phone_number
    end
  end
end
