class Guest < ActiveRecord::Base

  belongs_to :user
  validates :name, uniqueness: { scope: :surname }


end