class Group < ApplicationRecord
  has_many :students
  has_one :project
  belongs_to :mentor
end
