class Cohort < ApplicationRecord
  has_and_belongs_to_many :students
  belongs_to :course
  belongs_to :instructor, optional: true

  validates_presence_of   :name
  validates_presence_of   :start_date
  validates_presence_of   :end_date

end
