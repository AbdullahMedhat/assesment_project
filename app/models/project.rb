class Project < ApplicationRecord
  belongs_to :program
  has_many :submissions
  has_many :mentors, through: :program
  has_many :students, through: :program
end
