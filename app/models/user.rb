class User < ActiveRecord::Base

  attr_accessor :name, :email, :phone_number, :validation_code

  before_save { self.email = email.downcase,
                self.name = name.split.map(&:capitalize)*' ' }
  
  validates :name, presence: true, allow_blank: false
  validates :phone_number, format: { with: /\A\d*\z/ }

  VALID_EMAIL_REGEX =  /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
                    uniqueness:true

  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }

  VALIDATION_CODE = "beamauro2016"
  validates :validation_code, presence: true, inclusion: {:in => [VALIDATION_CODE]}


end