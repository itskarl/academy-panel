class Student < ApplicationRecord
  def full_name
  self.first_name + " " + self.last_name
  end

  has_and_belongs_to_many :cohorts

  has_secure_password
  
  def Student.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
    BCrypt :Password.create(string, cost: cost)
  end

end
