class Chef < ApplicationRecord
  validates :chefname, presence: true, length: {minimum: 3, maximum: 40}
  validates :email, presence: true, length: {maximum: 100},
             uniqueness: {case_sensitive: false}

end
