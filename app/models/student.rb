class Student < ApplicationRecord
  # Include default devise modules.
  has_many :projects
  devise :invitable, :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable,
          :validatable

  include DeviseTokenAuth::Concerns::User
  has_many :submissions
  belongs_to :program
end
