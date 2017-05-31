class Project < ApplicationRecord
  belongs_to :program
<<<<<<< Updated upstream
<<<<<<< Updated upstream
=======
  has_many :submissions
>>>>>>> Stashed changes
=======
  has_many :submissions
>>>>>>> Stashed changes
  has_many :mentors, through: :program
  has_many :students, through: :program
end
