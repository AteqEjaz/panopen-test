class User < ApplicationRecord
  has_many :user_readings

  validates :name,:email,  presence: true
  validates :email, uniqueness: true

end
