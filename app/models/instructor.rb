class Instructor < ApplicationRecord
    has_many :cohorts
    has_one_attached :photo
    has_secure_password
    validates :age, :inclusion => {:in => 1..149, :message => "should be between 1 and 149"}
    validates_presence_of   :first_name
    validates_presence_of   :last_name
    # validates :salary, :inclusion => {:in => 1..1000000, :message => "should be between 1 and 1,000,000"}

    def full_name
    self.first_name + " " + self.last_name
    end

    def Instructor.digest(string)
      cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
      BCrypt :Password.create(string, cost: cost)
    end
end
