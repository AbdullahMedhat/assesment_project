class Project < ApplicationRecord
  belongs_to :program
  belongs_to :mentor
  has_many :groups

end
