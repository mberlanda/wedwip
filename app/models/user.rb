class User < ActiveRecord::Base

  attr_accessor :name, :email, :phone_number, :validation_code, :remember_token

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

  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  def authenticated?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end
  
  def forget
    update_attribute(:remember_digest, nil)
  end
  
  class << self
    def digest(string)
      cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                    BCrypt::Engine.cost
      BCrypt::Password.create(string, cost: cost)
    end
    def new_token
      SecureRandom.urlsafe_base64
    end
  end
end