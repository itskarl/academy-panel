class Course < ApplicationRecord
  has_many :cohorts, dependent: :destroy

  validates :hours, :inclusion => {:in => 1..400, :message => "should be between 1 and 400"}
end
