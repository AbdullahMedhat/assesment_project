class Program < ApplicationRecord
  belongs_to :admin
  has_many :projects
  has_many :mentors
  has_many :students
    accepts_nested_attributes_for :projects
end
