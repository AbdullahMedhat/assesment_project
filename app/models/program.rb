class Program < ApplicationRecord
  belongs_to :admin
  has_many :students
  has_many :mentors

end
