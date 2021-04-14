class User < ActiveRecord::Base
    has_secure_password
    
    has_many :jabs
    validates :username, :email, presence: true
    validates :email, uniqueness: true
    validates :password_digest, presence: true
  end