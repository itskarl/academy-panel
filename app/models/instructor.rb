class Instructor < ApplicationRecord
    has_many :cohorts
    has_secure_password

    def full_name
    self.first_name + " " + self.last_name
    end

    def Instructor.digest(string)
      cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
      BCrypt :Password.create(string, cost: cost)
    end
end
