class User < ApplicationRecord
	validates :email,
      presence: true, #tjr rempli
      uniqueness: true,  #unique
      format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "email adress please" } #format
    validates :first_name,
      presence: true
    validates :last_name,
      presence: true
    validates :description,
      presence: true
    validates :encrypted_password, 
      presence: true,
      length: { minimum: 6 }
      
    
    has_many :events, foreign_key: 'admin_id', class_name: "Event"
    has_many :attendances
    has_many :events, through: :attendances
end
