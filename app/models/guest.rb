class Guest < ActiveRecord::Base

  belongs_to :user
  validates :name, uniqueness: { scope: :surname }
  before_save :capitalize_names

  def capitalize_names
    self.name.capitalize!
    self.surname.capitalize!
  end

end