class Student < ApplicationRecord
  # Include default devise modules.
  devise :invitable, :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable,
          :validatable

  include DeviseTokenAuth::Concerns::User
  has_many :submissions
end
