class Project < ApplicationRecord
  belongs_to :program
  has_many :mentors
  has_many :students
  has_many :groups

end
