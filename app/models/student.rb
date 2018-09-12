class Student < ApplicationRecord
  def full_name
  self.first_name + " " + self.last_name
  end

  has_and_belongs_to_many :cohorts
  # validates :age, :inclusion => {:in => 1..149, :message => "should be between 1 and 149"}
  has_secure_password
  # validates_presence_of   :first_name
  # validates_presence_of   :last_name


  def Student.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
    BCrypt :Password.create(string, cost: cost)
  end

end
