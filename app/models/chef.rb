class Chef < ApplicationRecord
  has_many :recipes
  has_many :likes
  validates :chefname, presence: true, length: {minimum: 3, maximum: 40}
  validates :email, presence: true, length: {maximum: 100},
             uniqueness: {case_sensitive: false}

  has_secure_password
end
