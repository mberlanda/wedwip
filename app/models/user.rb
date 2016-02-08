class User < ActiveRecord::Base

  before_save { self.email = email.downcase,
                self.name = name.split.map(&:capitalize)*' ' }

  attr_accessor :name, :email, :phone_number

  validates :name, presence: true, allow_blank: false
  validates :phone_number, format: { with: /\A\d*\z/ }

  VALID_EMAIL_REGEX =  /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
                    uniqueness:true

end