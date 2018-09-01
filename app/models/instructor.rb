class Instructor < ApplicationRecord
    has_and_belongs_to_many :cohorts
    has_secure_password

    def Instructor.digest(string)
      cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
      BCrypt :Password.create(string, cost: cost)
    end
end
