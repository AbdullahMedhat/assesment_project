class Program < ApplicationRecord
  belongs_to :admin
  has_many :projects
  has_many :mentors
end
