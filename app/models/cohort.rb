class Cohort < ApplicationRecord
  has_and_belongs_to_many :students
  has_many :sudents
  belongs_to :course
end
