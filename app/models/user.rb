class User < ActiveRecord::Base

  REGEX_EMAIL =  /\A\S+@.+\.\S+\z/

  attr_accessor :name, :email, :phone_number

  validates :name, presence: true, allow_blank: false
  validates :email, presence: true, format: { with: REGEX_EMAIL } 
  validates :phone_number, format: { with: /\A\d*\z/ }
end